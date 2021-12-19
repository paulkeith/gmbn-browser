import Foundation

class NearestMinuteDurationFormatter {
    func format(_ duration: TimeInterval) -> String {
        let durationAsMinutes = duration.asMinutes
        if (durationAsMinutes == 1) {
            return "1 minute"
        }
        
        return "\(durationAsMinutes) minutes"
    }
}
