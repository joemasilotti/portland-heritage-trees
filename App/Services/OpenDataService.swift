import Combine

protocol OpenDataService {
    var apiService: APIService { get }
    func getTrees() -> AnyPublisher<TreeListAPIResponse, APIError>
}

extension OpenDataService {
    func getTrees() -> AnyPublisher<TreeListAPIResponse, APIError> {
        apiService.request(with: OpenDataEndpoint.heritageTrees)
            .eraseToAnyPublisher()
    }
}
