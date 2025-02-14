public enum SerializationError: Error {
    case serializationFailed(object: String, error: Error)
    case deserializationFailed(object: String, error: Error)
}
