import Combine
import Foundation

class DescendingDateOrderYouTubeVideoRepository: VideoRepository {
    func get(offset: Int, count: Int) -> AnyPublisher<[Video], Error> {
        return Just([])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
