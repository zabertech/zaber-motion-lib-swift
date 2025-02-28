import Foundation
import ZaberMotionAscii
import ZaberMotionExceptions

let CYCLES = 100
let FIBER_COUNT = 12

func measureSpeed(id: Int) async -> Double {
    var values = [Double]()

    do {
        let connection = try await Connection.openTcp(hostName: "127.0.0.1", port: 11234)
        for _ in 0..<CYCLES {
            let start = DispatchTime.now()
            _ = try await connection.genericCommand(command: "")
            let end = DispatchTime.now()

            let elapsedNanoseconds = end.uptimeNanoseconds - start.uptimeNanoseconds
            let elapsedMilliseconds = Double(elapsedNanoseconds) / 1_000_000.0
            values.append(elapsedMilliseconds)
        }

        try await connection.close()

    } catch let e as MotionLibException {
        print("Error: \(e.message)")
    } catch {
        print("Error: \(error)")
    }

    let total = values.reduce(0, +)
    return total / Double(CYCLES)
}

@main
struct Main {
    static func main() async {
        for fibers in 1...FIBER_COUNT {
            var speeds = [Double]()
            async let tasks: [Double] = {
                // Launch measurements concurrently.
                return await withTaskGroup(of: Double.self) { group -> [Double] in
                    var results = [Double]()
                    for id in 1...fibers {
                        group.addTask {
                            await measureSpeed(id: id)
                        }
                    }
                    for await result in group {
                        results.append(result)
                    }
                    return results
                }
            }()

            speeds = await tasks
            let totalAvg = speeds.reduce(0, +) / Double(speeds.count)
            print("\(fibers): \(totalAvg)")
        }
    }
}
