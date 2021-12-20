import Dip
import SwiftUI

@main
struct GMBN_BrowserApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    static let container: DependencyContainer = {
        let container = DependencyContainer()
        
        container.register(.singleton) { HardCodedResultsVideoRepository() as VideoRepository }
        
        container.register(.unique) {
            VideoListViewModel(repository: try! container.resolve()!)
        }
        
        return container
    }()
}
