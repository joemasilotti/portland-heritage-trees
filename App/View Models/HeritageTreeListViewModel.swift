import Combine

class HeritageTreeListViewModel: ObservableObject, OpenDataService {
    let apiSession: APIService
    @Published var trees = [HeritageTree]()

    private var cancellables = Set<AnyCancellable>()

    init(apiSession: APIService) {
        self.apiSession = apiSession
    }

    func getHeritageTrees() {
        let cancellable = getHeritageTrees()
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Handle error:", error)
                case .finished:
                    break
                }
            }) { result in
                self.trees = result.features
            }
        cancellables.insert(cancellable)
    }
}
