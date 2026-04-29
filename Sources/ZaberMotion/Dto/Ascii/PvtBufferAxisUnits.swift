// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import UnitsInternal


/**
 * Specifies the units to use for a buffer axis when reading back a PVT buffer.
 * The axis number is used to determine a physical axis on the device for units conversion.
 */
public struct PvtBufferAxisUnits: Serializable {

    /**
     * Number of the physical axis on the device used for units conversion.
     */
    public var axisNumber: Int

    /**
     * Units to convert position values to.
     */
    public var positionUnits: Units

    /**
     * Units to convert velocity values to.
     */
    public var velocityUnits: Units

    public init(axisNumber: Int = 0, positionUnits: Units = Units.native, velocityUnits: Units = Units.native) {
        self.axisNumber = axisNumber
        self.positionUnits = positionUnits
        self.velocityUnits = velocityUnits
    }
}
