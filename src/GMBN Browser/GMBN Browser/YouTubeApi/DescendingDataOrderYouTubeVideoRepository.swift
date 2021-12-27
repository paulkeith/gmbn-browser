import Combine
import CombineMoya
import Foundation
import Moya

class DescendingDateOrderYouTubeVideoRepository: VideoRepository {
    private let api = MoyaProvider<YouTubeEndpoints>()
    private let channelId = "UC_A--fhX5gea0i4UtpD99Gg"
    
    func get(pageToken: String?) -> AnyPublisher<VideoPage, Error> {
        return self.api.requestPublisher(
            .search(
                part: "snippet",
                channelId: self.channelId,
                channelType: "any",
                order: "date",
                key: ApiKeys.youTube,
                maxResults: 50,
                pageToken: pageToken ?? ""
            )
        )
        .map { response in response.data }
        .decode(
            type: YouTubeSearchResponse.self,
            decoder: JSONDecoder()
        )
        .flatMap { searchResponse -> AnyPublisher<VideoPage, Error> in
            let videoIds = searchResponse.items.map { $0.id.videoId }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            return self.api.requestPublisher(.videos(
                parts: ["snippet", "contentDetails"],
                key: ApiKeys.youTube,
                maxResults: 50,
                ids: videoIds)
             )
            .map { response in response.data }
            .decode(
                type: YouTubeVideosResponse.self,
                decoder: decoder
            )
            .eraseToAnyPublisher()
            .map { videoResults -> VideoPage in
                let videos = videoResults.items.map { videoResult in
                    Video(
                        id: videoResult.id,
                        imageUrl: URL(string: videoResult.snippet.thumbnails.medium.url)!,
                        title: videoResult.snippet.title,
                        description: videoResult.snippet.description,
                        published: videoResult.snippet.publishedAt,
                        duration: videoResult.contentDetails.duration
                    )
                }
                
                return VideoPage(
                    videos: videos,
                    nextPageToken: searchResponse.nextPageToken
                )
            }
            .eraseToAnyPublisher()
        }
        .eraseToAnyPublisher()
    }
}
