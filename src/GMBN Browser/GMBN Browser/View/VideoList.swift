import SwiftUI
import SwiftUIInfiniteList

struct VideoList: View {
    @ObservedObject var viewModel: VideoListViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(self.viewModel.items) { item in
                        NavigationLink(destination: VideoDetail(viewModel: item)) {
                            VideoSummary(viewModel: item)
                            .onAppear {
                                if (self.viewModel.items.last == item) {
                                    self.viewModel.loadMore()
                                }
                            }
                            .background(Color(.secondarySystemBackground))
                        }
                        .buttonStyle(.plain)
                        .padding(12)
                        
                        if (self.viewModel.isLoading) {
                            ProgressView()
                        }
                    }
                }
                .background(Color(.secondarySystemBackground))
                .onAppear { self.viewModel.loadMore() }
            }
            .navigationTitle("All Videos")
        }
    }

//    init(viewModel: VideoListViewModel) {
//        self.viewModel = viewModel
//
//        UITableView.appearance().backgroundColor = .clear
//    }
}
