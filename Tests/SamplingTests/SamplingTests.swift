import XCTest
@testable import Sampling

final class SamplingTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Sampling().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
