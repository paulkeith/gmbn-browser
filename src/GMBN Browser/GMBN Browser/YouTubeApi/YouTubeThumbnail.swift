import Foundation

struct YouTubeThumbnail {
    let url: String
    let width: Int
    let height: Int
}

extension YouTubeThumbnail: Decodable {
}
