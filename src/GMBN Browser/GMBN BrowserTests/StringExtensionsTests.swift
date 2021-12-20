import Foundation
import XCTest

class StringExtensionsTests: XCTestCase {
    func testParseIso8601Duration_inputContainsSeconds_returnsCorrectTotal() {
        let input = "PT37S"
        let result = input.parseIso8601Duration()
        
        XCTAssertEqual(37, result)
    }
    
    func testParseIso8601Duration_inputContainsMinutesAndSeconds_returnsCorrectTotal() {
        let input = "PT5M37S"
        let result = input.parseIso8601Duration()
        
        XCTAssertEqual((5*60) + 37, result)
    }
    
    func testParseIso8601Duration_inputContainsHoursMinutesAndSeconds_returnsCorrectTotal() {
        let input = "PT12H30M5S"
        let result = input.parseIso8601Duration()
        
        XCTAssertEqual((12*60*60) + (30*60) + 5, result)
    }    
}
