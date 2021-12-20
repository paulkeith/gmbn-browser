import SwiftUI

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
                        .padding(Constants.defaultPadding)
                    }
                    
                    if (self.viewModel.isLoading) {
                        ProgressView().padding(Constants.defaultPadding)
                    }
                }
                .background(Color(.secondarySystemBackground))
                .onAppear { self.viewModel.loadMore() }
            }
            .navigationTitle("All Videos".localise())
        }
    }
    
    private class Constants {
        static let defaultPadding = CGFloat(12)
    }
}
