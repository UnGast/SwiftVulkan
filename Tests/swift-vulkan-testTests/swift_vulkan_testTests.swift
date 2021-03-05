import XCTest
@testable import swift_vulkan_test

final class swift_vulkan_testTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(swift_vulkan_test().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
