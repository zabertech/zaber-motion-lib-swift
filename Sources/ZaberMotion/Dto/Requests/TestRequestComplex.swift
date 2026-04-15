// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct TestRequestComplex: Serializable {
    public var intArray: [Int]
    public var testVariant: TestVariant

    public init(intArray: [Int] = [], testVariant: TestVariant = .axisType(AxisType(rawValue: 0)!)) {
        self.intArray = intArray
        self.testVariant = testVariant
    }
}
