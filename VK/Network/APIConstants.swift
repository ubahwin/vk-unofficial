import Foundation

final class APIConstants {
    static let vkApiBaseURL: String = "https://api.vk.com/"
    // swiftlint:disable line_length
    static let vkApiToken: String = "vk1.a.w-55baBD7fRZd18j5LjjgWJwYaLNg16E4w-n2pKkNdHkzvX6oIaQ6fzu1hCrTK6Y1eYUWbMJoyK9H30y8HmtEdxSFiARwsYuSPO-gwEgNqhcGcGAkv3I8u_WTyfikLpDDDJLhQEMR7mq_WaOBnjjPz8j3DN7bF6RWuZC_eB12pX_Zbn0LoZYhQex0pA_XPgG6Cv1eeH37r4MeBwREvR89Q"
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
