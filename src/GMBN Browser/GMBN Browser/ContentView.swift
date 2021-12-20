import SwiftUI

struct ContentView: View {
    var body: some View {
        VideoList(viewModel: try! GMBN_BrowserApp.container.resolve())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
