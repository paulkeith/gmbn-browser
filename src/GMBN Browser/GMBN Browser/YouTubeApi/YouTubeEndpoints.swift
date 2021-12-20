import Foundation
import Moya

enum YouTubeEndpoints {
    case search(
        part: String,
        channelId: String,
        channelType: String,
        order: String,
        key: String,
        maxResults: Int
    )
    case videos(
        parts: [String],
        key: String,
        maxResults: Int,
        ids: [String]
    )
}

extension YouTubeEndpoints: TargetType {
    var baseURL: URL {
        URL(string: "https://youtube.googleapis.com/youtube/v3")!
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    var path: String {
        switch self {
        case .search(part: _, channelId: _, channelType: _, order: _, key: _, maxResults: _):
            return "/search"
        case .videos(parts: _, key: _, maxResults: _, ids: _):
            return "/videos"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .search(part: _, channelId: _, channelType: _, order: _, key: _, maxResults: _):
            return .get
        case .videos(parts: _, key: _, maxResults: _, ids: _):
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case let .search(part: part, channelId: channelId, channelType: channelType, order: order, key: key, maxResults: maxResults):
            let parameters: [String: Any] = [
                "part": part,
                "channelId": channelId,
                "channelType": channelType,
                "order": order,
                "key": key,
                "maxResults": maxResults
            ]
            
            return .requestParameters(
                parameters: parameters,
                encoding: URLEncoding.default)
        case .videos(parts: let parts, key: let key, maxResults: let maxResults, ids: let ids):
            let parameters: [String: Any] = [
                "part": parts.joined(separator: ","),
                "key": key,
                "maxResults": maxResults,
                "id": ids.joined(separator: ",")
            ]
            
            return .requestParameters(
                parameters: parameters,
                encoding: URLEncoding.default)
        }
    }
    
    var sampleData: Data {
        return Data("".utf8)
    }
}
