// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct SetServoTuningPIDRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var paramset: DtoAscii.ServoTuningParamset
    public var p: Double
    public var i: Double
    public var d: Double
    public var fc: Double

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, paramset: DtoAscii.ServoTuningParamset = ServoTuningParamset(rawValue: 0)!, p: Double = 0.0, i: Double = 0.0, d: Double = 0.0, fc: Double = 0.0) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.paramset = paramset
        self.p = p
        self.i = i
        self.d = d
        self.fc = fc
    }
}
