import Combine
import Foundation

protocol VideoRepository {
    func get(pageToken: String?) -> AnyPublisher<VideoPage, Error>
}

extension VideoRepository {
    func get() -> AnyPublisher<VideoPage, Error> {
        return self.get(pageToken: nil)
    }
}
