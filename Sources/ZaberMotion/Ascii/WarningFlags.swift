// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

/**
 Warning flag constants that indicate whether any device fault or warning is active.
 For more information please refer to the
 [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_message_format_warning_flags).
 */
public final class WarningFlags {

    // Make constructor unavailable for static class
    @available(*, unavailable) private init() {}

    /**
     Critical System Error
     */
    public static let criticalSystemError: String = "FF"

    /**
     Peripheral Not Supported
     */
    public static let peripheralNotSupported: String = "FN"

    /**
     Peripheral Inactive
     */
    public static let peripheralInactive: String = "FZ"

    /**
     Hardware Emergency Stop Driver Disabled
     */
    public static let hardwareEmergencyStop: String = "FH"

    /**
     Overvoltage or Undervoltage Driver Disabled
     */
    public static let overvoltageOrUndervoltage: String = "FV"

    /**
     Driver Disabled on Startup or by Command
     Devices with Firmware 7.11 and above
     */
    public static let driverDisabledNoFault: String = "FO"

    /**
     Current Inrush Error
     */
    public static let currentInrushError: String = "FC"

    /**
     Motor Temperature Error
     */
    public static let motorTemperatureError: String = "FM"

    /**
     Driver Disabled
     Devices with Firmware 7.10 and lower
     */
    public static let driverDisabled: String = "FD"

    /**
     Encoder Error
     */
    public static let encoderError: String = "FQ"

    /**
     Index Error
     */
    public static let indexError: String = "FI"

    /**
     Analog Encoder Sync Error
     */
    public static let analogEncoderSyncError: String = "FA"

    /**
     Overdrive Limit Exceeded
     */
    public static let overdriveLimitExceeded: String = "FR"

    /**
     Stalled and Stopped
     */
    public static let stalledAndStopped: String = "FS"

    /**
     Stream Bounds Error
     */
    public static let streamBoundsError: String = "FB"

    /**
     Interpolated Path Deviation
     */
    public static let interpolatedPathDeviation: String = "FP"

    /**
     Limit Error
     */
    public static let limitError: String = "FE"

    /**
     Excessive Twist
     */
    public static let excessiveTwist: String = "FT"

    /**
     Unexpected Limit Trigger
     */
    public static let unexpectedLimitTrigger: String = "WL"

    /**
     Voltage Out of Range
     */
    public static let voltageOutOfRange: String = "WV"

    /**
     Controller Temperature High
     */
    public static let controllerTemperatureHigh: String = "WT"

    /**
     Stalled with Recovery
     */
    public static let stalledWithRecovery: String = "WS"

    /**
     Displaced When Stationary
     */
    public static let displacedWhenStationary: String = "WM"

    /**
     Invalid Calibration Type
     */
    public static let invalidCalibrationType: String = "WP"

    /**
     No Reference Position
     */
    public static let noReferencePosition: String = "WR"

    /**
     Device Not Homed
     */
    public static let deviceNotHomed: String = "WH"

    /**
     Manual Control
     */
    public static let manualControl: String = "NC"

    /**
     Movement Interrupted
     */
    public static let movementInterrupted: String = "NI"

    /**
     Stream Discontinuity
     */
    public static let streamDiscontinuity: String = "ND"

    /**
     Value Rounded
     */
    public static let valueRounded: String = "NR"

    /**
     Value Truncated
     */
    public static let valueTruncated: String = "NT"

    /**
     Setting Update Pending
     */
    public static let settingUpdatePending: String = "NU"

    /**
     Joystick Calibrating
     */
    public static let joystickCalibrating: String = "NJ"

    /**
     Device in Firmware Update Mode
     Firmware 6.xx only
     */
    public static let firmwareUpdateMode: String = "NB"

}
