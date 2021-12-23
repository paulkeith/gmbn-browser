import Combine
import Foundation

class VideoListViewModel: ObservableObject {
    @Published var items = [VideoSummaryViewModel]()
    @Published var isLoading = false
    
    private let repository: VideoRepository
    private var subscriptions = Set<AnyCancellable>()
    private var nextPageToken: String? = nil
    
    init(repository: VideoRepository) {
        self.repository = repository
    }
    
    func loadMore() {
        guard !self.isLoading else {
            return
        }
            
        self.isLoading = true
        
        self.repository.get(pageToken: self.nextPageToken)
            .receive(on: DispatchQueue.main)
            .sink { [self] foo in
                self.isLoading = false
            } receiveValue: { [self] videoPage in
                let newViewModels = videoPage.videos.map { video in
                    VideoSummaryViewModel(
                        id: video.id,
                        imageUrl: video.imageUrl,
                        title: video.title,
                        description: video.description,
                        published: video.published,
                        duration: video.duration
                    )
                }
                
                self.items += newViewModels
                self.nextPageToken = videoPage.nextPageToken
            }
            .store(in: &self.subscriptions)
        }
}
