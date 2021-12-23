import Foundation

struct YouTubeSearchResponse {
    let nextPageToken: String?
    let items: [YouTubeSearchItem]
}

extension YouTubeSearchResponse: Decodable {
}
