/* This file is generated. Do not modify by hand. */

/**
 * Named constants for all Zaber Binary protocol error codes.
 */
public enum ErrorCode: Int, Codable, Sendable {
    case `cannotHome` = 1
    case `deviceNumberInvalid` = 2
    case `addressInvalid` = 5
    case `voltageLow` = 14
    case `voltageHigh` = 15
    case `storedPositionInvalid` = 18
    case `absolutePositionInvalid` = 20
    case `relativePositionInvalid` = 21
    case `velocityInvalid` = 22
    case `axisInvalid` = 25
    case `axisDeviceNumberInvalid` = 26
    case `inversionInvalid` = 27
    case `velocityProfileInvalid` = 28
    case `velocityScaleInvalid` = 29
    case `loadEventInvalid` = 30
    case `returnEventInvalid` = 31
    case `joystickCalibrationModeInvalid` = 33
    case `peripheralIDInvalid` = 36
    case `resolutionInvalid` = 37
    case `runCurrentInvalid` = 38
    case `holdCurrentInvalid` = 39
    case `modeInvalid` = 40
    case `homeSpeedInvalid` = 41
    case `speedInvalid` = 42
    case `accelerationInvalid` = 43
    case `maximumPositionInvalid` = 44
    case `currentPositionInvalid` = 45
    case `maximumRelativeMoveInvalid` = 46
    case `offsetInvalid` = 47
    case `aliasInvalid` = 48
    case `lockStateInvalid` = 49
    case `deviceIDUnknown` = 50
    case `settingInvalid` = 53
    case `commandInvalid` = 64
    case `parkStateInvalid` = 65
    case `temperatureHigh` = 67
    case `digitalInputPinInvalid` = 68
    case `digitalOutputPinInvalid` = 71
    case `digitalOutputMaskInvalid` = 74
    case `analogInputPinInvalid` = 76
    case `moveIndexNumberInvalid` = 78
    case `indexDistanceInvalid` = 79
    case `cycleDistanceInvalid` = 80
    case `filterHolderIDInvalid` = 81
    case `absoluteForceInvalid` = 87
    case `autoReplyDisabledModeInvalid` = 101
    case `messageIDModeInvalid` = 102
    case `homeStatusInvalid` = 103
    case `homeSensorTypeInvalid` = 104
    case `autoHomeDisabledModeInvalid` = 105
    case `minimumPositionInvalid` = 106
    case `knobDisabledModeInvalid` = 107
    case `knobDirectionInvalid` = 108
    case `knobMovementModeInvalid` = 109
    case `knobJogSizeInvalid` = 110
    case `knobVelocityScaleInvalid` = 111
    case `knobVelocityProfileInvalid` = 112
    case `accelerationOnlyInvalid` = 113
    case `decelerationOnlyInvalid` = 114
    case `moveTrackingModeInvalid` = 115
    case `manualMoveTrackingDisabledModeInvalid` = 116
    case `moveTrackingPeriodInvalid` = 117
    case `closedLoopModeInvalid` = 118
    case `slipTrackingPeriodInvalid` = 119
    case `stallTimeoutInvalid` = 120
    case `deviceDirectionInvalid` = 121
    case `baudRateInvalid` = 122
    case `protocolInvalid` = 123
    case `baudRateOrProtocolInvalid` = 124
    case `busy` = 255
    case `systemError` = 257
    case `storageFull` = 401
    case `registerAddressInvalid` = 701
    case `registerValueInvalid` = 702
    case `savePositionInvalid` = 1600
    case `savePositionNotHomed` = 1601
    case `returnPositionInvalid` = 1700
    case `movePositionInvalid` = 1800
    case `movePositionNotHomed` = 1801
    case `relativePositionLimited` = 2146
    case `settingsLocked` = 3600
    case `bit1Invalid` = 4001
    case `bit2Invalid` = 4002
    case `disableAutoHomeInvalid` = 4008
    case `bit10Invalid` = 4010
    case `bit11Invalid` = 4011
    case `homeSwitchInvalid` = 4012
    case `bit13Invalid` = 4013
    case `bit14Invalid` = 4014
    case `bit15Invalid` = 4015
    case `deviceParked` = 6501
    case `driverDisabled` = 9001
}
