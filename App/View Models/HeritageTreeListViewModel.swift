import Combine

class HeritageTreeListViewModel: ObservableObject, OpenDataService {
    let apiSession: APIService
    @Published var treeViewModels = [HeritageTreeViewModel]()

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
                self.treeViewModels = result.features
                    .map({ HeritageTreeViewModel(tree: $0) })
            }
        cancellables.insert(cancellable)
    }
}
