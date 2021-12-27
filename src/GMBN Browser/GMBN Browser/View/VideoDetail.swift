import SwiftUI
import YouTubePlayerKit

struct VideoDetail: View {
    let viewModel: VideoSummaryViewModel
    
    private let youTubePlayer: YouTubePlayer
    
    init(viewModel: VideoSummaryViewModel) {
        self.viewModel = viewModel
        self.youTubePlayer = YouTubePlayer(source: .video(id: viewModel.id))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                YouTubePlayerView(self.youTubePlayer) { state in
                    switch state {
                    case .idle:
                        ProgressView()
                    case .ready:
                        EmptyView()
                    case .error(_):
                        Text("The video couldn't be loaded. Please try again later.".localise())
                    }
                }
                .frame(height: Constants.playerHeight)
                HStack {
                    Text(self.viewModel.published, style: .date)
                        .foregroundColor(.black)
                        .font(.caption)
                    Spacer()
                    Text(self.durationFormatter.format(self.viewModel.duration))
                        .foregroundColor(.black)
                        .font(.caption)
                }
                .padding(Constants.defaultCaptionPadding)
                Text(self.viewModel.title)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .padding([.leading, .trailing, .bottom], Constants.defaultPadding)
                
                Text(self.viewModel.description)
                    .foregroundColor(.black)
                    .padding([.leading, .trailing, .bottom], Constants.defaultPadding)
            }
            .background(.white)
            .cornerRadius(Constants.defaultCornerRadius)
            .padding(Constants.defaultPadding)
        }
        .background(Color(.secondarySystemBackground))
    }
    
    private let durationFormatter = NearestMinuteDurationFormatter()
    
    private class Constants {
        static let defaultCornerRadius = CGFloat(10)
        static let defaultPadding = CGFloat(12)
        static let defaultCaptionPadding = CGFloat(6)
        static let playerHeight = CGFloat(180)
    }
}
