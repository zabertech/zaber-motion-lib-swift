// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import UnitsInternal
import Gateway
import Dto
import DtoRequests

/**
 Module: ZaberMotion

 Helper for working with units of measure.
 */
public final class UnitTable {

    // Make constructor unavailable for static class
    @available(*, unavailable) private init() {}

    /**
     Module: ZaberMotion

     Gets the standard symbol associated with a given unit.

     - Parameters:
        - unit: Unit of measure.

     - Returns: Symbols corresponding to the given unit. Throws NoValueForKey if no symbol is defined.
     */
    public static func getSymbol(unit: Units) throws -> String {
        var request = DtoRequests.UnitGetSymbolRequest()
        request.unit = unit

        let response = try Gateway.callSync("units/get_symbol", request, DtoRequests.UnitGetSymbolResponse.fromByteArray)
        return response.symbol
    }

    /**
     Module: ZaberMotion

     Gets the unit enum value associated with a standard symbol.
     Note not all units can be retrieved this way.

     - Parameters:
        - symbol: Symbol to look up.

     - Returns: The unit enum value with the given symbols. Throws NoValueForKey if the symbol is not supported for lookup.
     */
    public static func getUnit(symbol: String) throws -> Units {
        var request = DtoRequests.UnitGetEnumRequest()
        request.symbol = symbol

        let response = try Gateway.callSync("units/get_enum", request, DtoRequests.UnitGetEnumResponse.fromByteArray)
        return response.unit
    }

    /**
     Module: ZaberMotion

     Converts a value from one unit to a different unit of the same dimension.
     Note that this function does not support native unit conversions.

     - Parameters:
        - value: The value to be converted.
        - fromUnit: The unit which the value is being converted from.
        - toUnit: The unit which the value is being converted to.

     - Returns: The converted value. Throws ConversionFailedException if unit is incompatible.
     */
    public static func convertUnits(value: Double, fromUnit: Units, toUnit: Units) throws -> Double {
        var request = DtoRequests.UnitConvertUnitRequest()
        request.value = value
        request.fromUnit = fromUnit
        request.toUnit = toUnit

        let response = try Gateway.callSync("units/convert_unit", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotion

     Converts a value from one unit to native units given unit conversion descriptor.

     - Parameters:
        - conversion: The unit conversion data retrieved from device or axis.
        - value: The value to be converted.
        - toUnit: The unit which the value is being converted to.

     - Returns: The converted value. Throws ConversionFailedException if unit is incompatible.
     */
    public static func convertToNativeUnits(conversion: UnitConversionDescriptor, value: Double, toUnit: Units) throws -> Double {
        var request = DtoRequests.UnitConvertNativeRequest()
        request.conversion = conversion
        request.value = value
        request.unit = toUnit

        let response = try Gateway.callSync("units/convert_to_native_unit", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotion

     Converts a value from one unit to native units given unit conversion descriptor.

     - Parameters:
        - conversion: The unit conversion data retrieved from device or axis.
        - value: The value to be converted.
        - fromUnit: The unit which the value is being converted from.

     - Returns: The converted value. Throws ConversionFailedException if unit is incompatible.
     */
    public static func convertFromNativeUnits(conversion: UnitConversionDescriptor, value: Double, fromUnit: Units) throws -> Double {
        var request = DtoRequests.UnitConvertNativeRequest()
        request.conversion = conversion
        request.value = value
        request.unit = fromUnit

        let response = try Gateway.callSync("units/convert_from_native_unit", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotion

     Converts values from one unit to native units given unit conversion descriptor.

     - Parameters:
        - conversion: The unit conversion data retrieved from device or axis.
        - values: The value to be converted.
        - toUnit: The unit which the value is being converted to.

     - Returns: The converted values. Throws ConversionFailedException if unit is incompatible.
     */
    public static func convertToNativeUnitsBatch(conversion: UnitConversionDescriptor, values: [Double], toUnit: Units) throws -> [Double] {
        var request = DtoRequests.UnitConvertNativeRequest()
        request.conversion = conversion
        request.values = values
        request.unit = toUnit

        let response = try Gateway.callSync("units/convert_to_native_unit_batch", request, DtoRequests.DoubleArrayResponse.fromByteArray)
        return response.values
    }

    /**
     Module: ZaberMotion

     Converts values from one unit to native units given unit conversion descriptor.

     - Parameters:
        - conversion: The unit conversion data retrieved from device or axis.
        - values: The value to be converted.
        - fromUnit: The unit which the value is being converted from.

     - Returns: The converted values. Throws ConversionFailedException if unit is incompatible.
     */
    public static func convertFromNativeUnitsBatch(conversion: UnitConversionDescriptor, values: [Double], fromUnit: Units) throws -> [Double] {
        var request = DtoRequests.UnitConvertNativeRequest()
        request.conversion = conversion
        request.values = values
        request.unit = fromUnit

        let response = try Gateway.callSync("units/convert_from_native_unit_batch", request, DtoRequests.DoubleArrayResponse.fromByteArray)
        return response.values
    }

}
