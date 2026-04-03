// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * The source used by a process in a closed-loop mode.
 */
public struct ProcessControllerSource: Serializable {

    /**
     * The type of input sensor.
     */
    public var sensor: ProcessControllerSourceSensor

    /**
     * The specific input to use.
     */
    public var port: Int

    public init(sensor: ProcessControllerSourceSensor = ProcessControllerSourceSensor(rawValue: 0)!, port: Int = 0) {
        self.sensor = sensor
        self.port = port
    }
}
