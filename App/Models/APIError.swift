enum APIError: Error {
    case decoding, http(Int), unknown
}
