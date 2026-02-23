/* This file is generated. Do not modify by hand. */

/**
 * The type of input sensor that provides feedback to the process controller.
 */
public enum ProcessControllerSourceSensor: Int, Codable, Sendable {
    /// Use a thermistor sensor port on the device to measure temperature.
    case `thermistor` = 10
    /// Use an analog input I/O channel on the device to measure voltage.
    case `analogInput` = 20
}
