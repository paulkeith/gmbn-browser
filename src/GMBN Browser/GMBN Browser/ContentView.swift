import SwiftUI

struct ContentView: View {
    var body: some View {
        VideoList(
            viewModel: VideoListViewModel(
                repository: YouTubeVideoRepository()
            )
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
