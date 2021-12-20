import Foundation

struct YouTubeVideosResponse {
    let items: [YouTubeVideoItem]
}

extension YouTubeVideosResponse: Decodable {
}
