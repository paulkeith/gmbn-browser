import Foundation

extension String {
    func localise(_ comment: String? = nil) -> String {
        guard let comment = comment else {
            return NSLocalizedString(self, comment: self)
        }
        
        return NSLocalizedString(self, comment: comment)
    }
}
