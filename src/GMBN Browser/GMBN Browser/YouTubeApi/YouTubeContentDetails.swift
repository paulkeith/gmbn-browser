import Foundation

struct YouTubeContentDetails {
    let duration: TimeInterval
}

extension YouTubeContentDetails: Decodable {
    enum CodingKeys: String, CodingKey {
        case duration
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.duration = try values.decode(String.self, forKey: .duration).parseIso8601Duration()
    }
}
