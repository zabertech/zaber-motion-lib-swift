/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

/**
 * The masses and parameters last used by simple tuning.
 */
public struct SimpleTuning: Serializable {

    /**
     * Whether the tuning returned is currently in use by this paramset,
     * or if it has been overwritten by a later change.
     */
    public var isUsed: Bool

    /**
     * If this paramset has been tuned using the simple tuning method, whether or not it's currently in use.
     */
    public var isSet: Bool

    /**
     * The inertia of the carriage in kg (for linear devices) or kg⋅m² (for rotary devices).
     */
    public var carriageInertia: Double?

    /**
     * The inertia of the motor in kg⋅m².
     */
    public var motorInertia: Double?

    /**
     * The inertia of the load in kg (for linear devices) or kg⋅m² (for rotary devices),
     * excluding the inertia of the carriage.
     */
    public var loadInertia: Double

    /**
     * The parameters used by simple tuning.
     */
    public var tuningParams: [ServoTuningParam]

    public init(isUsed: Bool = false, isSet: Bool = false, carriageInertia: Double? = nil, motorInertia: Double? = nil, loadInertia: Double = 0.0, tuningParams: [ServoTuningParam] = []) {
        self.isUsed = isUsed
        self.isSet = isSet
        self.carriageInertia = carriageInertia
        self.motorInertia = motorInertia
        self.loadInertia = loadInertia
        self.tuningParams = tuningParams
    }
}
