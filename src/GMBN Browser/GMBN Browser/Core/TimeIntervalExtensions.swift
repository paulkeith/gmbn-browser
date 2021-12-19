import Foundation

extension TimeInterval {
    public var asMinutes: Int {
        let wholeMinutes = Int(self) / 60
        let remainingSeconds = self.truncatingRemainder(dividingBy: 60)
        
        if remainingSeconds >= 30 {
            return wholeMinutes + 1
        }
        
        return wholeMinutes
    }
}
