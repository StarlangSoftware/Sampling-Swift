import XCTest
@testable import Sampling

final class StratifiedKFoldCrossValidationTest: XCTestCase {
    var smallSample : [[String]] = []
    var largeSample : [[Int]] = []
    
    override func setUp(){
        let inputClass1 : [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
        let inputClass2 : [String] = ["11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
                "21", "22", "23", "24", "25", "26", "27", "28", "29", "30"]
        self.smallSample = [inputClass1, inputClass2]
        var class1 : [Int] = []
        for i in 0..<1000{
            class1.append(i)
        }
        var class2 : [Int] = []
        for i in 0..<3000{
            class2.append(1000 + i)
        }
        var class3 : [Int] = []
        for i in 0..<5000{
            class3.append(4000 + i)
        }
        self.largeSample = [class1, class2, class3]

    }

    func testSmallSample10Fold(){
        let stratifiedKFoldCrossValidation : StratifiedKFoldCrossValidation<String> = StratifiedKFoldCrossValidation<String>(instanceLists: self.smallSample, K: 10, seed: 1)
        let expected1 : [String] = ["1", "21", "19"]
        XCTAssertEqual(expected1, stratifiedKFoldCrossValidation.getTestFold(k: 0))
    }

    func testSmallSample5Fold(){
        let stratifiedKFoldCrossValidation : StratifiedKFoldCrossValidation<String> = StratifiedKFoldCrossValidation<String>(instanceLists: self.smallSample, K: 5, seed: 1)
        let expected2 : [String] = ["1", "5", "21", "19", "29", "13"]
        XCTAssertEqual(expected2, stratifiedKFoldCrossValidation.getTestFold(k: 0))
    }

    func testSmallSample2Fold(){
        let stratifiedKFoldCrossValidation : StratifiedKFoldCrossValidation<String> = StratifiedKFoldCrossValidation<String>(instanceLists: self.smallSample, K: 2, seed: 1)
        let expected3 : [String] = ["1", "5", "10", "7", "3", "21", "19", "29", "13", "16", "23", "28", "18", "14", "12"]
        XCTAssertEqual(expected3, stratifiedKFoldCrossValidation.getTestFold(k: 0))
    }

    func testLargeSample10Fold(){
        let stratifiedKFoldCrossValidation : StratifiedKFoldCrossValidation<Int> = StratifiedKFoldCrossValidation(instanceLists: self.largeSample, K: 10, seed: 1)
        for i in 0..<10{
            var items = Set<Int>()
            let trainFold : [Int] = stratifiedKFoldCrossValidation.getTrainFold(k: i)
            let testFold : [Int] = stratifiedKFoldCrossValidation.getTestFold(k: i)
            items.formUnion(trainFold)
            items.formUnion(testFold)
            XCTAssertEqual(900, testFold.count)
            XCTAssertEqual(8100, trainFold.count)
            XCTAssertEqual(9000, items.count)
            var trainCounts : [Int] = [0, 0, 0]
            for integer in trainFold{
                if integer < 1000{
                    trainCounts[0] = trainCounts[0] + 1
                } else if integer < 4000{
                    trainCounts[1] = trainCounts[1] + 1
                } else {
                    trainCounts[2] = trainCounts[2] + 1
                }
            }
            XCTAssertEqual(900, trainCounts[0])
            XCTAssertEqual(2700, trainCounts[1])
            XCTAssertEqual(4500, trainCounts[2])
            var testCounts : [Int] = [0, 0, 0]
            for integer in testFold{
                if integer < 1000{
                    testCounts[0] = testCounts[0] + 1
                } else if integer < 4000{
                    testCounts[1] = testCounts[1] + 1
                } else {
                    testCounts[2] = testCounts[2] + 1
                }
            }
            XCTAssertEqual(100, testCounts[0])
            XCTAssertEqual(300, testCounts[1])
            XCTAssertEqual(500, testCounts[2])
        }
    }

    func testLargeSample5Fold(){
        let stratifiedKFoldCrossValidation : StratifiedKFoldCrossValidation<Int> = StratifiedKFoldCrossValidation(instanceLists: self.largeSample, K: 5, seed: 1)
        for i in 0..<5{
            var items = Set<Int>()
            let trainFold : [Int] = stratifiedKFoldCrossValidation.getTrainFold(k: i)
            let testFold : [Int] = stratifiedKFoldCrossValidation.getTestFold(k: i)
            items.formUnion(trainFold)
            items.formUnion(testFold)
            XCTAssertEqual(1800, testFold.count)
            XCTAssertEqual(7200, trainFold.count)
            XCTAssertEqual(9000, items.count)
            var trainCounts : [Int] = [0, 0, 0]
            for integer in trainFold{
                if integer < 1000{
                    trainCounts[0] = trainCounts[0] + 1
                } else if integer < 4000{
                    trainCounts[1] = trainCounts[1] + 1
                } else {
                    trainCounts[2] = trainCounts[2] + 1
                }
            }
            XCTAssertEqual(800, trainCounts[0])
            XCTAssertEqual(2400, trainCounts[1])
            XCTAssertEqual(4000, trainCounts[2])
            var testCounts : [Int] = [0, 0, 0]
            for integer in testFold{
                if integer < 1000{
                    testCounts[0] = testCounts[0] + 1
                } else if integer < 4000{
                    testCounts[1] = testCounts[1] + 1
                } else {
                    testCounts[2] = testCounts[2] + 1
                }
            }
            XCTAssertEqual(200, testCounts[0])
            XCTAssertEqual(600, testCounts[1])
            XCTAssertEqual(1000, testCounts[2])
        }
    }

    func testLargeSample2Fold(){
        let stratifiedKFoldCrossValidation : StratifiedKFoldCrossValidation<Int> = StratifiedKFoldCrossValidation(instanceLists: self.largeSample, K: 2, seed: 1)
        for i in 0..<2{
            var items = Set<Int>()
            let trainFold : [Int] = stratifiedKFoldCrossValidation.getTrainFold(k: i)
            let testFold : [Int] = stratifiedKFoldCrossValidation.getTestFold(k: i)
            items.formUnion(trainFold)
            items.formUnion(testFold)
            XCTAssertEqual(4500, testFold.count)
            XCTAssertEqual(4500, trainFold.count)
            XCTAssertEqual(9000, items.count)
            var trainCounts : [Int] = [0, 0, 0]
            for integer in trainFold{
                if integer < 1000{
                    trainCounts[0] = trainCounts[0] + 1
                } else if integer < 4000{
                    trainCounts[1] = trainCounts[1] + 1
                } else {
                    trainCounts[2] = trainCounts[2] + 1
                }
            }
            XCTAssertEqual(500, trainCounts[0])
            XCTAssertEqual(1500, trainCounts[1])
            XCTAssertEqual(2500, trainCounts[2])
            var testCounts : [Int] = [0, 0, 0]
            for integer in testFold{
                if integer < 1000{
                    testCounts[0] = testCounts[0] + 1
                } else if integer < 4000{
                    testCounts[1] = testCounts[1] + 1
                } else {
                    testCounts[2] = testCounts[2] + 1
                }
            }
            XCTAssertEqual(500, testCounts[0])
            XCTAssertEqual(1500, testCounts[1])
            XCTAssertEqual(2500, testCounts[2])
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
