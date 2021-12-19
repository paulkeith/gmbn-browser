import Combine
import Foundation

class YouTubeVideoRepository: VideoRepository {
    func get(offset: Int, count: Int) -> AnyPublisher<[Video], Error> {
        return (1...15).publisher
            .map { index in
                Video(
                    id: "\(UUID())",
                    imageUrl: URL(string: "https://i.ytimg.com/vi/5x5GOQTn8Os/mqdefault.jpg")!, title: "Game Of Cards with Kaos Seagrave, Blake Samson And Neil Donoghue!",
                    description: "Blake Samson and Neil Donoghue link up with World Cup Downhill racer & Freerider Kaos Seagrave for a game of CARDS at the ...",
                    published: Date.now.addingTimeInterval(Double(24 * 60 * 60 * index)),
                    duration: 529
                )
            }
            .collect()
            .delay(for: .seconds(2), scheduler: RunLoop.main)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
