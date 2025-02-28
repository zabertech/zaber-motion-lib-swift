﻿// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Gateway
import DtoRequests

/**
 Access class to general library information and configuration.
 */
public final class Library {

    // Make constructor unavailable for static class
    @available(*, unavailable) private init() {}

    /**
     Sets library logging output.

     - Parameters:
        - mode: Logging output mode.
        - filePath: Path of the file to open.
     */
    public static func setLogOutput(mode: LogOutputMode, filePath: String? = nil) throws  {
        var request = DtoRequests.SetLogOutputRequest()
        request.mode = mode
        request.filePath = filePath

        try Gateway.callSync("logging/set_output", request)
    }

    /**
     Sets source of Device DB data. Allows selection of a web service or a local file.

     - Parameters:
        - sourceType: Source type.
        - urlOrFilePath: URL of the web service or path to the local file.
          Leave empty for the default URL of Zaber web service.
     */
    public static func setDeviceDbSource(sourceType: DeviceDbSourceType, urlOrFilePath: String? = nil) throws  {
        var request = DtoRequests.SetDeviceDbSourceRequest()
        request.sourceType = sourceType
        request.urlOrFilePath = urlOrFilePath

        try Gateway.callSync("device_db/set_source", request)
    }

    /**
     Enables Device DB store.
     The store uses filesystem to save information obtained from the Device DB.
     The stored data are later used instead of the Device DB.

     - Parameters:
        - storeLocation: Specifies relative or absolute path of the folder used by the store.
          If left empty defaults to a folder in user home directory.
          Must be accessible by the process.
     */
    public static func enableDeviceDbStore(storeLocation: String? = nil) throws  {
        var request = DtoRequests.ToggleDeviceDbStoreRequest()
        request.toggleOn = true
        request.storeLocation = storeLocation

        try Gateway.callSync("device_db/toggle_store", request)
    }

    /**
     Disables Device DB store.
     */
    public static func disableDeviceDbStore() throws  {
        let request = DtoRequests.ToggleDeviceDbStoreRequest()

        try Gateway.callSync("device_db/toggle_store", request)
    }

    /**
     Disables certain customer checks (like FF flag).

     - Parameters:
        - mode: Whether to turn internal mode on or off.
     */
    public static func setInternalMode(mode: Bool) throws  {
        var request = DtoRequests.SetInternalModeRequest()
        request.mode = mode

        try Gateway.callSync("library/set_internal_mode", request)
    }

    /**
     Sets the period between polling for IDLE during movements.
     Caution: Setting the period too low may cause performance issues.

     - Parameters:
        - period: Period in milliseconds.
          Negative value restores the default period.
     */
    public static func setIdlePollingPeriod(period: Int) throws  {
        var request = DtoRequests.IntRequest()
        request.value = period

        try Gateway.callSync("library/set_idle_polling_period", request)
    }

    /**
     Throws an error if the version of the loaded shared library does not match the caller's version.
     */
    public static func checkVersion() throws  {
        var request = DtoRequests.CheckVersionRequest()
        request.host = "swift"
        request.version = "7.4.2"

        try Gateway.callSync("library/check_version", request)
    }

}
