// This file is generated from the Zaber device database. Do not manually edit this file.

public enum Units: String, Codable, Sendable {
    case native = ""

    case lengthMetres = "Length:metres"
    case lengthCentimetres = "Length:centimetres"
    case lengthMillimetres = "Length:millimetres"
    case lengthMicrometres = "Length:micrometres"
    case lengthNanometres = "Length:nanometres"
    case lengthInches = "Length:inches"

    public struct Length {
        @available(*, unavailable) private init() { }

        public static let `m` = Units.lengthMetres
        public static let `cm` = Units.lengthCentimetres
        public static let `mm` = Units.lengthMillimetres
        public static let `µm` = Units.lengthMicrometres
        public static let `um` = Units.lengthMicrometres
        public static let `nm` = Units.lengthNanometres
        public static let `in` = Units.lengthInches
    }

    case velocityMetresPerSecond = "Velocity:metres per second"
    case velocityCentimetresPerSecond = "Velocity:centimetres per second"
    case velocityMillimetresPerSecond = "Velocity:millimetres per second"
    case velocityMicrometresPerSecond = "Velocity:micrometres per second"
    case velocityNanometresPerSecond = "Velocity:nanometres per second"
    case velocityInchesPerSecond = "Velocity:inches per second"

    public static let velocity: [String: Units] = [
        "m/s": .velocityMetresPerSecond,
        "cm/s": .velocityCentimetresPerSecond,
        "mm/s": .velocityMillimetresPerSecond,
        "µm/s": .velocityMicrometresPerSecond,
        "um/s": .velocityMicrometresPerSecond,
        "nm/s": .velocityNanometresPerSecond,
        "in/s": .velocityInchesPerSecond,
    ]

    case accelerationMetresPerSecondSquared = "Acceleration:metres per second squared"
    case accelerationCentimetresPerSecondSquared = "Acceleration:centimetres per second squared"
    case accelerationMillimetresPerSecondSquared = "Acceleration:millimetres per second squared"
    case accelerationMicrometresPerSecondSquared = "Acceleration:micrometres per second squared"
    case accelerationNanometresPerSecondSquared = "Acceleration:nanometres per second squared"
    case accelerationInchesPerSecondSquared = "Acceleration:inches per second squared"

    public static let acceleration: [String: Units] = [
        "m/s²": .accelerationMetresPerSecondSquared,
        "m/s^2": .accelerationMetresPerSecondSquared,
        "cm/s²": .accelerationCentimetresPerSecondSquared,
        "cm/s^2": .accelerationCentimetresPerSecondSquared,
        "mm/s²": .accelerationMillimetresPerSecondSquared,
        "mm/s^2": .accelerationMillimetresPerSecondSquared,
        "µm/s²": .accelerationMicrometresPerSecondSquared,
        "um/s^2": .accelerationMicrometresPerSecondSquared,
        "nm/s²": .accelerationNanometresPerSecondSquared,
        "nm/s^2": .accelerationNanometresPerSecondSquared,
        "in/s²": .accelerationInchesPerSecondSquared,
        "in/s^2": .accelerationInchesPerSecondSquared,
    ]

    case angleDegrees = "Angle:degrees"
    case angleRadians = "Angle:radians"

    public static let angle: [String: Units] = [
        "°": .angleDegrees,
        "deg": .angleDegrees,
        "rad": .angleRadians,
    ]

    case angularVelocityDegreesPerSecond = "Angular Velocity:degrees per second"
    case angularVelocityRadiansPerSecond = "Angular Velocity:radians per second"

    public static let angularVelocity: [String: Units] = [
        "°/s": .angularVelocityDegreesPerSecond,
        "deg/s": .angularVelocityDegreesPerSecond,
        "rad/s": .angularVelocityRadiansPerSecond,
    ]

    case angularAccelerationDegreesPerSecondSquared = "Angular Acceleration:degrees per second squared"
    case angularAccelerationRadiansPerSecondSquared = "Angular Acceleration:radians per second squared"

    public static let angularAcceleration: [String: Units] = [
        "°/s²": .angularAccelerationDegreesPerSecondSquared,
        "deg/s^2": .angularAccelerationDegreesPerSecondSquared,
        "rad/s²": .angularAccelerationRadiansPerSecondSquared,
        "rad/s^2": .angularAccelerationRadiansPerSecondSquared,
    ]

    case aCElectricCurrentAmperesPeak = "AC Electric Current:amperes peak"
    case aCElectricCurrentAmperesRms = "AC Electric Current:amperes RMS"

    public static let acElectricCurrent: [String: Units] = [
        "A(peak)": .aCElectricCurrentAmperesPeak,
        "A(RMS)": .aCElectricCurrentAmperesRms,
    ]

    case percentPercent = "Percent:percent"

    public static let percent: [String: Units] = [
        "%": .percentPercent,
    ]

    case dCElectricCurrentAmperes = "DC Electric Current:amperes"

    public struct DCElectricCurrent {
        @available(*, unavailable) private init() { }

        public static let `A` = Units.dCElectricCurrentAmperes
    }

    case forceNewtons = "Force:newtons"
    case forceMillinewtons = "Force:millinewtons"
    case forcePoundsForce = "Force:pounds-force"
    case forceKilonewtons = "Force:kilonewtons"

    public struct Force {
        @available(*, unavailable) private init() { }

        public static let `N` = Units.forceNewtons
        public static let `mN` = Units.forceMillinewtons
        public static let `lbf` = Units.forcePoundsForce
        public static let `kN` = Units.forceKilonewtons
    }

    case timeSeconds = "Time:seconds"
    case timeMilliseconds = "Time:milliseconds"
    case timeMicroseconds = "Time:microseconds"

    public struct Time {
        @available(*, unavailable) private init() { }

        public static let `s` = Units.timeSeconds
        public static let `ms` = Units.timeMilliseconds
        public static let `µs` = Units.timeMicroseconds
        public static let `us` = Units.timeMicroseconds
    }

    case torqueNewtonMetres = "Torque:newton metres"
    case torqueNewtonCentimetres = "Torque:newton centimetres"
    case torquePoundForceFeet = "Torque:pound-force-feet"
    case torqueOunceForceInches = "Torque:ounce-force-inches"

    public static let torque: [String: Units] = [
        "N⋅m": .torqueNewtonMetres,
        "N⋅cm": .torqueNewtonCentimetres,
        "lbf⋅ft": .torquePoundForceFeet,
        "ozf⋅in": .torqueOunceForceInches,
    ]

    case inertiaGrams = "Inertia:grams"
    case inertiaKilograms = "Inertia:kilograms"
    case inertiaMilligrams = "Inertia:milligrams"
    case inertiaPounds = "Inertia:pounds"
    case inertiaOunces = "Inertia:ounces"

    public struct Inertia {
        @available(*, unavailable) private init() { }

        public static let `g` = Units.inertiaGrams
        public static let `kg` = Units.inertiaKilograms
        public static let `mg` = Units.inertiaMilligrams
        public static let `lb` = Units.inertiaPounds
        public static let `oz` = Units.inertiaOunces
    }

    case rotationalInertiaGramSquareMetre = "Rotational Inertia:gram-square metre"
    case rotationalInertiaKilogramSquareMetre = "Rotational Inertia:kilogram-square metre"
    case rotationalInertiaPoundSquareFeet = "Rotational Inertia:pound-square-feet"
    case rotationalInertiaGramSquareMillimetre = "Rotational Inertia:gram-square millimetre"

    public static let rotationalInertia: [String: Units] = [
        "g⋅m²": .rotationalInertiaGramSquareMetre,
        "g⋅m^2": .rotationalInertiaGramSquareMetre,
        "kg⋅m²": .rotationalInertiaKilogramSquareMetre,
        "kg⋅m^2": .rotationalInertiaKilogramSquareMetre,
        "lb⋅ft²": .rotationalInertiaPoundSquareFeet,
        "lb⋅ft^2": .rotationalInertiaPoundSquareFeet,
        "g⋅mm²": .rotationalInertiaGramSquareMillimetre,
        "g⋅mm^2": .rotationalInertiaGramSquareMillimetre,
    ]

    case forceConstantNewtonsPerAmp = "Force Constant:newtons per amp"
    case forceConstantMillinewtonsPerAmp = "Force Constant:millinewtons per amp"
    case forceConstantKilonewtonsPerAmp = "Force Constant:kilonewtons per amp"
    case forceConstantPoundsForcePerAmp = "Force Constant:pounds-force per amp"

    public static let forceConstant: [String: Units] = [
        "N/A": .forceConstantNewtonsPerAmp,
        "mN/A": .forceConstantMillinewtonsPerAmp,
        "kN/A": .forceConstantKilonewtonsPerAmp,
        "lbf/A": .forceConstantPoundsForcePerAmp,
    ]

    case torqueConstantNewtonMetresPerAmp = "Torque Constant:newton metres per amp"
    case torqueConstantMillinewtonMetresPerAmp = "Torque Constant:millinewton metres per amp"
    case torqueConstantKilonewtonMetresPerAmp = "Torque Constant:kilonewton metres per amp"
    case torqueConstantPoundForceFeetPerAmp = "Torque Constant:pound-force-feet per amp"

    public static let torqueConstant: [String: Units] = [
        "N⋅m/A": .torqueConstantNewtonMetresPerAmp,
        "mN⋅m/A": .torqueConstantMillinewtonMetresPerAmp,
        "kN⋅m/A": .torqueConstantKilonewtonMetresPerAmp,
        "lbf⋅ft/A": .torqueConstantPoundForceFeetPerAmp,
    ]

    case voltageVolts = "Voltage:volts"
    case voltageMillivolts = "Voltage:millivolts"
    case voltageMicrovolts = "Voltage:microvolts"

    public struct Voltage {
        @available(*, unavailable) private init() { }

        public static let `V` = Units.voltageVolts
        public static let `mV` = Units.voltageMillivolts
        public static let `µV` = Units.voltageMicrovolts
        public static let `uV` = Units.voltageMicrovolts
    }

    case currentControllerProportionalGainVoltsPerAmp = "Current Controller Proportional Gain:volts per amp"
    case currentControllerProportionalGainMillivoltsPerAmp = "Current Controller Proportional Gain:millivolts per amp"
    case currentControllerProportionalGainMicrovoltsPerAmp = "Current Controller Proportional Gain:microvolts per amp"

    public static let currentControllerProportionalGain: [String: Units] = [
        "V/A": .currentControllerProportionalGainVoltsPerAmp,
        "mV/A": .currentControllerProportionalGainMillivoltsPerAmp,
        "µV/A": .currentControllerProportionalGainMicrovoltsPerAmp,
        "uV/A": .currentControllerProportionalGainMicrovoltsPerAmp,
    ]

    case currentControllerIntegralGainVoltsPerAmpPerSecond = "Current Controller Integral Gain:volts per amp per second"
    case currentControllerIntegralGainMillivoltsPerAmpPerSecond = "Current Controller Integral Gain:millivolts per amp per second"
    case currentControllerIntegralGainMicrovoltsPerAmpPerSecond = "Current Controller Integral Gain:microvolts per amp per second"

    public static let currentControllerIntegralGain: [String: Units] = [
        "V/(A⋅s)": .currentControllerIntegralGainVoltsPerAmpPerSecond,
        "mV/(A⋅s)": .currentControllerIntegralGainMillivoltsPerAmpPerSecond,
        "µV/(A⋅s)": .currentControllerIntegralGainMicrovoltsPerAmpPerSecond,
        "uV/(A⋅s)": .currentControllerIntegralGainMicrovoltsPerAmpPerSecond,
    ]

    case currentControllerDerivativeGainVoltsSecondPerAmp = "Current Controller Derivative Gain:volts second per amp"
    case currentControllerDerivativeGainMillivoltsSecondPerAmp = "Current Controller Derivative Gain:millivolts second per amp"
    case currentControllerDerivativeGainMicrovoltsSecondPerAmp = "Current Controller Derivative Gain:microvolts second per amp"

    public static let currentControllerDerivativeGain: [String: Units] = [
        "V⋅s/A": .currentControllerDerivativeGainVoltsSecondPerAmp,
        "mV⋅s/A": .currentControllerDerivativeGainMillivoltsSecondPerAmp,
        "µV⋅s/A": .currentControllerDerivativeGainMicrovoltsSecondPerAmp,
        "uV⋅s/A": .currentControllerDerivativeGainMicrovoltsSecondPerAmp,
    ]

    case resistanceKiloohms = "Resistance:kiloohms"
    case resistanceOhms = "Resistance:ohms"
    case resistanceMilliohms = "Resistance:milliohms"
    case resistanceMicroohms = "Resistance:microohms"
    case resistanceNanoohms = "Resistance:nanoohms"

    public struct Resistance {
        @available(*, unavailable) private init() { }

        public static let `kΩ` = Units.resistanceKiloohms
        public static let `Ω` = Units.resistanceOhms
        public static let `mΩ` = Units.resistanceMilliohms
        public static let `µΩ` = Units.resistanceMicroohms
        public static let `uΩ` = Units.resistanceMicroohms
        public static let `nΩ` = Units.resistanceNanoohms
    }

    case inductanceHenries = "Inductance:henries"
    case inductanceMillihenries = "Inductance:millihenries"
    case inductanceMicrohenries = "Inductance:microhenries"
    case inductanceNanohenries = "Inductance:nanohenries"

    public struct Inductance {
        @available(*, unavailable) private init() { }

        public static let `H` = Units.inductanceHenries
        public static let `mH` = Units.inductanceMillihenries
        public static let `µH` = Units.inductanceMicrohenries
        public static let `uH` = Units.inductanceMicrohenries
        public static let `nH` = Units.inductanceNanohenries
    }

    case voltageConstantVoltSecondsPerRadian = "Voltage Constant:volt seconds per radian"
    case voltageConstantMillivoltSecondsPerRadian = "Voltage Constant:millivolt seconds per radian"
    case voltageConstantMicrovoltSecondsPerRadian = "Voltage Constant:microvolt seconds per radian"

    public static let voltageConstant: [String: Units] = [
        "V·s/rad": .voltageConstantVoltSecondsPerRadian,
        "mV·s/rad": .voltageConstantMillivoltSecondsPerRadian,
        "µV·s/rad": .voltageConstantMicrovoltSecondsPerRadian,
        "uV·s/rad": .voltageConstantMicrovoltSecondsPerRadian,
    ]

    case absoluteTemperatureDegreesCelsius = "Absolute Temperature:degrees Celsius"
    case absoluteTemperatureKelvins = "Absolute Temperature:kelvins"
    case absoluteTemperatureDegreesFahrenheit = "Absolute Temperature:degrees Fahrenheit"
    case absoluteTemperatureDegreesRankine = "Absolute Temperature:degrees Rankine"

    public static let absoluteTemperature: [String: Units] = [
        "°C": .absoluteTemperatureDegreesCelsius,
        "degC": .absoluteTemperatureDegreesCelsius,
        "K": .absoluteTemperatureKelvins,
        "°F": .absoluteTemperatureDegreesFahrenheit,
        "degF": .absoluteTemperatureDegreesFahrenheit,
        "°R": .absoluteTemperatureDegreesRankine,
        "degR": .absoluteTemperatureDegreesRankine,
    ]

    case relativeTemperatureDegreesCelsius = "Relative Temperature:degrees Celsius"
    case relativeTemperatureKelvins = "Relative Temperature:kelvins"
    case relativeTemperatureDegreesFahrenheit = "Relative Temperature:degrees Fahrenheit"
    case relativeTemperatureDegreesRankine = "Relative Temperature:degrees Rankine"

    public static let relativeTemperature: [String: Units] = [
        "°C": .relativeTemperatureDegreesCelsius,
        "degC": .relativeTemperatureDegreesCelsius,
        "K": .relativeTemperatureKelvins,
        "°F": .relativeTemperatureDegreesFahrenheit,
        "degF": .relativeTemperatureDegreesFahrenheit,
        "°R": .relativeTemperatureDegreesRankine,
        "degR": .relativeTemperatureDegreesRankine,
    ]

    case frequencyGigahertz = "Frequency:gigahertz"
    case frequencyMegahertz = "Frequency:megahertz"
    case frequencyKilohertz = "Frequency:kilohertz"
    case frequencyHertz = "Frequency:hertz"
    case frequencyMillihertz = "Frequency:millihertz"
    case frequencyMicrohertz = "Frequency:microhertz"
    case frequencyNanohertz = "Frequency:nanohertz"

    public struct Frequency {
        @available(*, unavailable) private init() { }

        public static let `GHz` = Units.frequencyGigahertz
        public static let `MHz` = Units.frequencyMegahertz
        public static let `kHz` = Units.frequencyKilohertz
        public static let `Hz` = Units.frequencyHertz
        public static let `mHz` = Units.frequencyMillihertz
        public static let `µHz` = Units.frequencyMicrohertz
        public static let `uHz` = Units.frequencyMicrohertz
        public static let `nHz` = Units.frequencyNanohertz
    }
}
