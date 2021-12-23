import SwiftUI

struct VideoSummary: View {
    let viewModel: VideoSummaryViewModel
    
    var body: some View {
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
            .padding(6)
            
            Text(self.viewModel.title)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .font(.title)
                .padding([.leading, .trailing, .bottom], 12)
        }
        .background(.white)
        .cornerRadius(10)
    }
    
    private let durationFormatter = NearestMinuteDurationFormatter()
}
