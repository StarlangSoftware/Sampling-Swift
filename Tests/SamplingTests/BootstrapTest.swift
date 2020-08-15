import XCTest
@testable import Sampling

final class BootstrapTest: XCTestCase {
    var smallSample : [String] = []
    var largeSample : [Int] = []
    
    override func setUp(){
        self.smallSample = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
        self.largeSample = []
        for i in 0..<1000000{
            self.largeSample.append(i)
        }
    }

    func testLargeSample() {
        let bootstrap : Bootstrap = Bootstrap(instanceList: self.largeSample, seed: 1)
        let sample : [Int] = bootstrap.getSample()
        var sampleSet = Set<Int>()
        sampleSet.formUnion(sample)
        XCTAssertEqual(Double(sampleSet.count) / 1000000.0, 0.632, accuracy: 3)
    }

    static var allTests = [
        ("testExample1", testLargeSample),
    ]
}
