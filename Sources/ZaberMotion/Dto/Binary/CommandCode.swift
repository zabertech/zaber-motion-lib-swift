/* This file is generated. Do not modify by hand. */

/**
 * Named constants for all Zaber Binary protocol commands.
 */
public enum CommandCode: Int, Codable, Sendable {
    case `reset` = 0
    case `home` = 1
    case `renumber` = 2
    case `storeCurrentPosition` = 16
    case `returnStoredPosition` = 17
    case `moveToStoredPosition` = 18
    case `moveAbsolute` = 20
    case `moveRelative` = 21
    case `moveAtConstantSpeed` = 22
    case `stop` = 23
    case `setActiveAxis` = 25
    case `setAxisDeviceNumber` = 26
    case `setAxisInversion` = 27
    case `setAxisVelocityProfile` = 28
    case `setAxisVelocityScale` = 29
    case `loadEventInstruction` = 30
    case `returnEventInstruction` = 31
    case `setCalibrationMode` = 33
    public static var setJoystickCalibrationMode: CommandCode { .setCalibrationMode } // = 33
    case `readOrWriteMemory` = 35
    case `restoreSettings` = 36
    case `setMicrostepResolution` = 37
    case `setRunningCurrent` = 38
    case `setHoldCurrent` = 39
    case `setDeviceMode` = 40
    case `setHomeSpeed` = 41
    public static var setStartSpeed: CommandCode { .setHomeSpeed } // = 41
    case `setTargetSpeed` = 42
    case `setAcceleration` = 43
    case `setMaximumPosition` = 44
    case `setCurrentPosition` = 45
    case `setMaximumRelativeMove` = 46
    case `setHomeOffset` = 47
    case `setAliasNumber` = 48
    case `setLockState` = 49
    case `returnDeviceID` = 50
    case `returnFirmwareVersion` = 51
    case `returnPowerSupplyVoltage` = 52
    case `returnSetting` = 53
    case `returnStatus` = 54
    case `echoData` = 55
    case `returnFirmwareBuild` = 56
    case `returnCurrentPosition` = 60
    case `returnSerialNumber` = 63
    case `setParkState` = 65
    case `setPeripheralID` = 66
    case `returnDigitalInputCount` = 67
    case `readDigitalInput` = 68
    case `readAllDigitalInputs` = 69
    case `returnDigitalOutputCount` = 70
    case `readDigitalOutput` = 71
    case `readAllDigitalOutputs` = 72
    case `writeDigitalOutput` = 73
    case `writeAllDigitalOutputs` = 74
    case `returnAnalogInputCount` = 75
    case `readAnalogInput` = 76
    case `returnAnalogOutputCount` = 77
    case `moveIndex` = 78
    case `setIndexDistance` = 79
    case `setCycleDistance` = 80
    case `setFilterHolderID` = 81
    case `returnEncoderCount` = 82
    case `returnCalibratedEncoderCount` = 83
    case `returnCalibrationType` = 84
    case `returnCalibrationError` = 85
    case `returnPeripheralSerialNumber` = 86
    public static var setPeripheralSerialNumber: CommandCode { .returnPeripheralSerialNumber } // = 86
    case `forceAbsolute` = 87
    case `forceOff` = 88
    case `returnEncoderPosition` = 89
    case `returnPeripheralIDPending` = 91
    case `returnPeripheralSerialPending` = 92
    case `activate` = 93
    case `setAutoReplyDisabledMode` = 101
    case `setMessageIDMode` = 102
    case `setHomeStatus` = 103
    case `setHomeSensorType` = 104
    case `setAutoHomeDisabledMode` = 105
    case `setMinimumPosition` = 106
    case `setKnobDisabledMode` = 107
    case `setKnobDirection` = 108
    case `setKnobMovementMode` = 109
    case `setKnobJogSize` = 110
    case `setKnobVelocityScale` = 111
    case `setKnobVelocityProfile` = 112
    case `setAccelerationOnly` = 113
    case `setDecelerationOnly` = 114
    case `setMoveTrackingMode` = 115
    case `setManualMoveTrackingDisabledMode` = 116
    case `setMoveTrackingPeriod` = 117
    case `setClosedLoopMode` = 118
    case `setSlipTrackingPeriod` = 119
    case `setStallTimeout` = 120
    case `setDeviceDirection` = 121
    case `setBaudRate` = 122
    case `setProtocol` = 123
    case `convertToASCII` = 124
}
