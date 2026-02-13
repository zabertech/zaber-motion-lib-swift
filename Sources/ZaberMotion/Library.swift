// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Gateway
import DtoRequests

/**
 Module: ZaberMotion

 Access class to general library information and configuration.
 */
public final class Library {

    // Make constructor unavailable for static class
    @available(*, unavailable) private init() {}

    /**
     Module: ZaberMotion

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
     Module: ZaberMotion

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
     Module: ZaberMotion

     Sets a sequence of sources. When the library needs device information,
     it will try each source in the order they are provided.

     - Parameters:
        - sources: The list of sources the library will access data from.
     */
    public static func setDeviceDbSources(_ sources: DeviceDbSource...) throws  {
        var request = DtoRequests.SetDeviceDbLayeredSourcesRequest()
        request.sources = sources

        try Gateway.callSync("device_db/set_sources", request)
    }

    /**
     Module: ZaberMotion

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
     Module: ZaberMotion

     Disables Device DB store.
     */
    public static func disableDeviceDbStore() throws  {
        let request = DtoRequests.ToggleDeviceDbStoreRequest()

        try Gateway.callSync("device_db/toggle_store", request)
    }

    /**
     Module: ZaberMotion

     Checks if the Device DB store is currently enabled.

     - Returns: True if the Device DB store is enabled.
     */
    public static func isDeviceDbStoreEnabled() throws -> Bool {
        let request = DtoRequests.EmptyRequest()

        let response = try Gateway.callSync("device_db/check_store", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotion

     Clears the Device DB store on the local filesystem.
     Note: If the device DB was enabled with a custom store location, store files will be removed in that location.
     */
    public static func clearDeviceDbStore() async throws  {
        let request = DtoRequests.EmptyRequest()

        try await Gateway.callAsync("device_db/clear_store", request)
    }

    /**
     Module: ZaberMotion

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
     Module: ZaberMotion

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
     Module: ZaberMotion

     Throws an error if the version of the loaded shared library does not match the caller's version.
     */
    @available(*, deprecated, message: "Calling this function is no longer necessary as the check happens automatically.")
    public static func checkVersion() throws  {
        var request = DtoRequests.CheckVersionRequest()
        request.host = "swift"
        request.version = "8.2.0"

        try Gateway.callSync("library/check_version", request)
    }

    /**
     Module: ZaberMotion

     For internal use only: tells zaber motion core which host application it is bundled in.

     - Parameters:
        - hostApplication: String name of the host application with which ZML is bundled.
     */
    public static func setHostApplication(hostApplication: String) throws  {
        var request = DtoRequests.StringResponse()
        request.value = hostApplication

        try Gateway.callSync("library/set_host_application", request)
    }

}
