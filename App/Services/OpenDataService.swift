import Combine

protocol OpenDataService {
    var apiSession: APIService { get }
    func getHeritageTrees() -> AnyPublisher<HeritageTreeListAPIResponse, APIError>
}

extension OpenDataService {
    func getHeritageTrees() -> AnyPublisher<HeritageTreeListAPIResponse, APIError> {
        apiSession.request(with: OpenDataEndpoint.heritageTrees)
            .eraseToAnyPublisher()
    }
}
