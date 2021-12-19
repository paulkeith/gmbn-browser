import Foundation

struct VideoSummaryViewModel : Identifiable {
    let id: String
    let imageUrl: URL
    let title: String
    let description: String
    let published: Date
    let duration: TimeInterval
}

extension VideoSummaryViewModel: Equatable {
    
}
