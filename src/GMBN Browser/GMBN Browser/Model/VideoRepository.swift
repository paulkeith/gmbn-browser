import Combine
import Foundation

protocol VideoRepository {
    /// Gets a maximum of count results, starting from the index
    /// specified by offset.
    /// - parameter offet: The index to start fetching results from.
    /// - parameter count: The maximum number of videos to return.
    func get(offset: Int, count: Int) -> AnyPublisher<[Video], Error>
}

extension VideoRepository {
    /// Gets 25 results, starting from the index specified by offset.
    /// - parameter offet: The index to start fetching results from.
    func get(offset: Int) -> AnyPublisher<[Video], Error> {
        return self.get(offset: offset, count: 25)
    }
    
    /// Gets the first 25 results.
    func get() -> AnyPublisher<[Video], Error> {
        return self.get(offset: 0)
    }
}
