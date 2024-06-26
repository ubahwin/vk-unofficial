import Foundation

final class APIConstants {
    static let vkApiBaseURL: String = "https://api.vk.com/"
    // swiftlint:disable line_length
    static let vkApiToken: String = "<token>"
    // swiftlint:enable line_length
    static let vkApiVersion: String = "5.199"
}

enum HTTPHeaderField: String {
    case authentication = "Authentication"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case authorization = "Authorization"
    case acceptLanguage = "Accept-Language"
    case userAgent = "User-Agent"
}

enum ContentType: String {
    case json = "application/json"
    case xwwwformurlencoded = "application/x-www-form-urlencoded"
}
