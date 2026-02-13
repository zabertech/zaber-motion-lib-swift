// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Gateway
import DtoRequests
import Dto
import Utils

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

    /**
     Module: ZaberMotion

     Discover Zaber devices shared over local network over TCP/IP.

     - Parameters:
        - duration: Optional time in ms to wait for mDNS discovery response (defaults to 3000).
        - interfaceIpAddress: Specify which network interface to use by IP address.
          If no value or an empty string is provided, mDNS query is sent to all compatible network interfaces.

     - Returns: Array of discovered devices.
     */
    public static func discoverTcpDevices(duration: Int = 3000, interfaceIpAddress: String? = nil) async throws -> [DeviceDiscoveryResult] {
        _assertSendable(DeviceDiscoveryResult.self)

        var request = DtoRequests.DiscoverMdnsRequest()
        request.duration = duration
        request.interfaceIpAddress = interfaceIpAddress

        let response = try await Gateway.callAsync("tools/discover_tcp_devices", request, DtoRequests.DiscoverTCPDevicesResponse.fromByteArray)
        return response.result
    }

}
