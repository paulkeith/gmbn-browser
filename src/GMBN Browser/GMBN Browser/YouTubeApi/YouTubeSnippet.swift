import Foundation

struct YouTubeSnippet {
    let publishedAt: Date
    let title: String
    let description: String
    let thumbnails: YouTubeThumbnails
}

extension YouTubeSnippet: Decodable {
}
