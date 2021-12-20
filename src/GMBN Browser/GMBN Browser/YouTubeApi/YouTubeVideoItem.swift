import Foundation

struct YouTubeVideoItem {
    let id: String
    let snippet: YouTubeSnippet
    let contentDetails: YouTubeContentDetails
}

extension YouTubeVideoItem: Decodable {
}
