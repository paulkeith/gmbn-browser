import Foundation

extension String {
    public func localise(_ comment: String? = nil) -> String {
        guard let comment = comment else {
            return NSLocalizedString(self, comment: self)
        }
        
        return NSLocalizedString(self, comment: comment)
    }
    
    /// Attempts to parse the receiver as an ISO 8601 time duration.  The duration is
    /// expected to be in hours and minutes.  Years, months, weeks and days will be
    /// ignored.
    public func parseIso8601Duration() -> TimeInterval {
        var duration = self
        if duration.hasPrefix("PT") {
            duration.removeFirst(2)
        }
        
        var totalSeconds: Double = 0
        
        if let index = duration.firstIndex(of: "H") {
            let hours = Double(duration[..<index]) ?? 0
            totalSeconds += (hours * 60 * 60)
            duration.removeSubrange(...index)
        }
        
        if let index = duration.firstIndex(of: "M") {
            let minutes = Double(duration[..<index]) ?? 0
            totalSeconds += (minutes * 60)
            duration.removeSubrange(...index)
        }
        
        if let index = duration.firstIndex(of: "S") {
            let seconds = Double(duration[..<index]) ?? 0
            totalSeconds += seconds
        }
            
        return totalSeconds
    }
}
