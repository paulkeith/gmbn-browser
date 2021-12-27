import Foundation
import SwiftUI

extension View {
    func onLoad(perform action: (() -> Void)? = nil) -> some View {
        self.modifier(ViewDidLoadModifier(perform: action))
    }
}
