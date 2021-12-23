import SwiftUI

struct VideoDetail: View {
    let viewModel: VideoSummaryViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                Thumbnail(url: self.viewModel.imageUrl)
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
    }
}
