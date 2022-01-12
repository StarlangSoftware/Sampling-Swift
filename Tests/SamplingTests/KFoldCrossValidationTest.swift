import XCTest
@testable import Sampling

final class KFoldCrossValidationTest: XCTestCase {
    var smallSample : [String] = []
    var largeSample : [Int] = []
    
    override func setUp(){
        self.smallSample = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
        self.largeSample = []
        for i in 0..<1000{
            self.largeSample.append(i)
        }
    }

    func testSmallSample10Fold(){
        let kFoldCrossValidation : KFoldCrossValidation = KFoldCrossValidation(instanceList: self.smallSample, K: 10, seed: 1)
        let expected1 : [String] = ["1"]
        XCTAssertEqual(expected1, kFoldCrossValidation.getTestFold(k: 0))
    }

    func testSmallSample5Fold(){
        let kFoldCrossValidation : KFoldCrossValidation = KFoldCrossValidation(instanceList: self.smallSample, K: 5, seed: 1)
        let expected2 : [String] = ["1", "5"]
        XCTAssertEqual(expected2, kFoldCrossValidation.getTestFold(k: 0))
    }

    func testSmallSample2Fold(){
        let kFoldCrossValidation : KFoldCrossValidation = KFoldCrossValidation(instanceList: self.smallSample, K: 2, seed: 1)
        let expected3 : [String] = ["1", "5", "10", "7", "3"]
        XCTAssertEqual(expected3, kFoldCrossValidation.getTestFold(k: 0))
    }

    func testLargeSample10Fold(){
        let kFoldCrossValidation : KFoldCrossValidation = KFoldCrossValidation(instanceList: self.largeSample, K: 10, seed: 1)
        for i in 0..<10{
            var items = Set<Int>()
            let trainFold : [Int] = kFoldCrossValidation.getTrainFold(k: i)
            let testFold : [Int] = kFoldCrossValidation.getTestFold(k: i)
            items.formUnion(trainFold)
            items.formUnion(testFold)
            XCTAssertEqual(100, testFold.count)
            XCTAssertEqual(900, trainFold.count)
            XCTAssertEqual(1000, items.count)
        }
    }

    func testLargeSample5Fold(){
        let kFoldCrossValidation : KFoldCrossValidation = KFoldCrossValidation(instanceList: self.largeSample, K: 5, seed: 1)
        for i in 0..<5{
            var items = Set<Int>()
            let trainFold : [Int] = kFoldCrossValidation.getTrainFold(k: i)
            let testFold : [Int] = kFoldCrossValidation.getTestFold(k: i)
            items.formUnion(trainFold)
            items.formUnion(testFold)
            XCTAssertEqual(200, testFold.count)
            XCTAssertEqual(800, trainFold.count)
            XCTAssertEqual(1000, items.count)
        }
    }

    func testLargeSample2Fold(){
        let kFoldCrossValidation : KFoldCrossValidation = KFoldCrossValidation(instanceList: self.largeSample, K: 2, seed: 1)
        for i in 0..<2{
            var items = Set<Int>()
            let trainFold : [Int] = kFoldCrossValidation.getTrainFold(k: i)
            let testFold : [Int] = kFoldCrossValidation.getTestFold(k: i)
            items.formUnion(trainFold)
            items.formUnion(testFold)
            XCTAssertEqual(500, testFold.count)
            XCTAssertEqual(500, trainFold.count)
            XCTAssertEqual(1000, items.count)
        }
    }

    static var allTests = [
        ("testExample1", testSmallSample10Fold),
        ("testExample2", testSmallSample5Fold),
        ("testExample3", testSmallSample2Fold),
        ("testExample4", testLargeSample10Fold),
        ("testExample5", testLargeSample5Fold),
        ("testExample6", testLargeSample2Fold),
    ]
}
