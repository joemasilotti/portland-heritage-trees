import Foundation

enum OpenDataEndpoint {
    case heritageTrees
}

extension OpenDataEndpoint: RequestBuilder {
    var urlRequest: URLRequest {
        switch self {
        case .heritageTrees:
            let url = baseURL
                .appendingPathComponent("datasets")
                .appendingPathComponent("fd1d618ac3174ad5be730524a4dd778e_26.geojson")
            return URLRequest(url: url)
        }
    }

    private var baseURL: URL {
        guard let url = URL(string: "https://opendata.arcgis.com")
        else { preconditionFailure("Invalid URL format") }
        return url
    }
}
