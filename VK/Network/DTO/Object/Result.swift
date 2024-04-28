struct Result<T: Codable>: Codable {
    let response: T?
}
