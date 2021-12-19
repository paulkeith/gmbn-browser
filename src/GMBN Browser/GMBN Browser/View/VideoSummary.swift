import SwiftUI

struct VideoSummary: View {
    let viewModel: VideoSummaryViewModel
    
    var durationFormatter = NearestMinuteDurationFormatter()
    
    var body: some View {
        VStack {
            AsyncImage(url: self.viewModel.imageUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxHeight: 180)
            } placeholder: {
                ProgressView()
                    .frame(width: 320, height: 180)
            }
            HStack {
                Text(self.viewModel.published, style: .date).font(.caption)
                Spacer()
                Text(self.durationFormatter.format(self.viewModel.duration)).font(.caption)
            }
            .padding(6)
            
            Text(self.viewModel.title)
                .multilineTextAlignment(.center)
                .font(.title)
                .padding([.leading, .trailing, .bottom], 12)
        }
        .background(.white)
        .cornerRadius(10)
    }
}
