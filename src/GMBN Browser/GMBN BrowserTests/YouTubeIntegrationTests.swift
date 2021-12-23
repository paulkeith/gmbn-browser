import Combine
import CombineMoya
import Moya
import XCTest
@testable import GMBN_Browser

/// These integration tests are useful during development but shouldn't be run as part
/// of the main unit test suite, because they call the real YouTube API.  As such all
/// the method names begin with skip instead of test.  Replace the prefix with test to
/// use the methods.
class YouTubeIntegrationTests: XCTestCase {
    private var cancellables = Set<AnyCancellable>()
    
    func skip_search_canDecodeResponse() {
        let myExpectation = expectation(description: "")
        let provider = MoyaProvider<YouTubeEndpoints>()
        
        provider.requestPublisher(
            .search(
                part: "snippet",
                channelId: "UC_A--fhX5gea0i4UtpD99Gg",
                channelType: "any",
                order: "date",
                key: ApiKeys.youTube,
                maxResults: 50,
                pageToken: ""
            ))
            .sink(receiveCompletion: { completion in
                myExpectation.fulfill()
            }, receiveValue: { response in
                do {
                    let decoder = JSONDecoder()
                    let searchResponse = try decoder.decode(
                        YouTubeSearchResponse.self,
                        from: response.data
                    )
                    
                    XCTAssertEqual("CDIQAA", searchResponse.nextPageToken)
                } catch _ {
                    XCTFail()
                }
            })
            .store(in: &self.cancellables)
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func skip_videos_canDecodeResponse() {
        let myExpectation = expectation(description: "")
        let provider = MoyaProvider<YouTubeEndpoints>()
        
        provider.requestPublisher(
            .videos(
                parts: ["snippet", "contentDetails"],
                key: ApiKeys.youTube,
                maxResults: 50,
                ids: ["Yh9Ce45cSaI", "5x5GOQTn8Os"]
            ))
            .sink(receiveCompletion: { completion in
                myExpectation.fulfill()
            }, receiveValue: { response in
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    
                    let videosResponse = try decoder.decode(
                        YouTubeVideosResponse.self,
                        from: response.data
                    )
                    
                    XCTAssertEqual(2, videosResponse.items.count)
                } catch _ {
                    XCTFail()
                }
            })
            .store(in: &self.cancellables)
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func skipGetPage_withEmptyPageToken_getsFirstPage() {
        let myExpectation = expectation(description: "")
        
        let repository = DescendingDateOrderYouTubeVideoRepository()
        
        repository.get(pageToken: nil)
            .sink(
                receiveCompletion: { _ in myExpectation.fulfill() },
                receiveValue: { page in
                    XCTAssertTrue(page.videos.count > 0)
                })
            .store(in: &self.cancellables)
        
        waitForExpectations(timeout: 3, handler: nil)
    }
}
