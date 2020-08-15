import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(BootstrapTest.allTests),
        testCase(KFoldCrossValidationTest.allTests),
        testCase(StratifiedKFoldCrossValidationTest.allTests),
    ]
}
#endif
