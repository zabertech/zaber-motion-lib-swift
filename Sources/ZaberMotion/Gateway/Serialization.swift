import DtoSerializable
import Foundation

let sizeTypeSize = MemoryLayout<UInt32>.size

func serialize(_ messages: [any Serializable]) throws -> Data {
    var totalLength: UInt32 = UInt32(sizeTypeSize)
    var serializedMessages: [Data] = []

    for msg in messages {
        let serializedMessage = try msg.toByteArray()
        serializedMessages.append(serializedMessage)
        totalLength += UInt32(serializedMessage.count) + UInt32(sizeTypeSize)
    }
    var stringBuffer = Data()
    stringBuffer.reserveCapacity(Int(totalLength))

    let totalLengthBytes = withUnsafeBytes(of: totalLength.littleEndian, Array.init)
    stringBuffer.append(contentsOf: totalLengthBytes)

    for serializedMessage in serializedMessages {
        let msgSize: UInt32 = UInt32(serializedMessage.count)
        let msgSizeBytes = withUnsafeBytes(of: msgSize.littleEndian, Array.init)
        stringBuffer.append(contentsOf: msgSizeBytes)
        stringBuffer.append(serializedMessage)
    }
    return stringBuffer
}

func deserialize(_ responseData: UnsafeRawPointer) -> [Data] {
    let msgLen = responseData.load(as: UInt32.self)
    let responseBuffer = Data(bytes: responseData, count: Int(msgLen))

    let sizeTypeSize = MemoryLayout<UInt32>.size
    var offset = sizeTypeSize
    var responses: [Data] = []

    while offset < responseBuffer.count {
        var msgSize: UInt32 = 0
        _ = withUnsafeMutableBytes(of: &msgSize) { buffer in
            responseBuffer.copyBytes(to: buffer, from: offset..<(offset + sizeTypeSize))
        }
        msgSize = UInt32(littleEndian: msgSize)
        offset += sizeTypeSize

        let rawResponse = responseBuffer.subdata(in: offset..<(offset + Int(msgSize)))
        responses.append(rawResponse)
        offset += Int(msgSize)
    }
    return responses
}
