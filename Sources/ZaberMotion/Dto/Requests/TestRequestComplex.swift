// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import Dto


public struct TestRequestComplex: Serializable {
    public var intArray: [Int]
    public var measurementOrValue: Dto.MeasurementOrValue?

    public init(intArray: [Int] = [], measurementOrValue: Dto.MeasurementOrValue? = nil) {
        self.intArray = intArray
        self.measurementOrValue = measurementOrValue
    }
}
