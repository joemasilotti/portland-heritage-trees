import Combine
import Foundation

struct LocalSession: APIService {
    func request<T>(with builder: RequestBuilder) -> AnyPublisher<T, APIError> where T: Decodable {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        if let path = Bundle.main.path(forResource: "HeritageTrees", ofType: "geojson") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return Just(data)
                    .decode(type: T.self, decoder: decoder)
                    .mapError { _ in .decoding }
                    .eraseToAnyPublisher()
            } catch {
                return Fail(error: .decoding)
                    .eraseToAnyPublisher()
            }
        }
        return Fail(error: .decoding)
            .eraseToAnyPublisher()
    }
}
