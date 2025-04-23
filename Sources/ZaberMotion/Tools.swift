// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Gateway
import DtoRequests

/**
 Module: ZaberMotion

 Class providing various utility functions.
 */
public final class Tools {

    // Make constructor unavailable for static class
    @available(*, unavailable) private init() {}

    /**
     Module: ZaberMotion

     Lists all serial ports on the computer.

     - Returns: Array of serial port names.
     */
    public static func listSerialPorts() async throws -> [String] {
        let request = DtoRequests.EmptyRequest()

        let response = try await Gateway.callAsync("tools/list_serial_ports", request, DtoRequests.ToolsListSerialPortsResponse.fromByteArray)
        return response.ports
    }

    /**
     Module: ZaberMotion

     Returns path of message router named pipe on Windows
     or file path of unix domain socket on UNIX.

     - Returns: Path of message router's named pipe or unix domain socket.
     */
    public static func getMessageRouterPipePath() throws -> String {
        let request = DtoRequests.EmptyRequest()

        let response = try Gateway.callSync("tools/get_message_router_pipe", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotion

     Returns the path for communicating with a local device database service.
     This will be a named pipe on Windows and the file path of a unix domain socket on UNIX.

     - Returns: Path of database service's named pipe or unix domain socket.
     */
    public static func getDbServicePipePath() throws -> String {
        let request = DtoRequests.EmptyRequest()

        let response = try Gateway.callSync("tools/get_db_service_pipe", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

}
