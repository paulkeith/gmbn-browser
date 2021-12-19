import SwiftUI

struct Thumbnail: View {
    let url: URL
    
    var body: some View {
        AsyncImage(url: self.url) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxHeight: Constants.defaultThumbnailHeight)
        } placeholder: {
            ProgressView()
                .frame(
                    width: Constants.defaultThumbnailWidth,
                    height: Constants.defaultThumbnailHeight,
                    alignment: .center
                )
        }
    }
    
    private class Constants {
        static let defaultThumbnailWidth = CGFloat(320)
        static let defaultThumbnailHeight = CGFloat(180)
    }
}

struct Thumbnail_Previews: PreviewProvider {
    static var previews: some View {
        Thumbnail(url: URL(string: "https://i.ytimg.com/vi/5x5GOQTn8Os/mqdefault.jpg")!)
    }
}
