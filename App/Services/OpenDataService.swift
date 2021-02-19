import Combine

protocol OpenDataService {
    var apiSession: APIService { get }
    func getTrees() -> AnyPublisher<TreeListAPIResponse, APIError>
}

extension OpenDataService {
    func getTrees() -> AnyPublisher<TreeListAPIResponse, APIError> {
        apiSession.request(with: OpenDataEndpoint.heritageTrees)
            .eraseToAnyPublisher()
    }
}
