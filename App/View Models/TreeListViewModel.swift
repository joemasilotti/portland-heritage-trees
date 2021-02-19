import Combine

class TreeListViewModel: ObservableObject, OpenDataService {
    let apiSession: APIService
    @Published var treeViewModels = [TreeViewModel]()

    private var cancellables = Set<AnyCancellable>()

    init(apiSession: APIService) {
        self.apiSession = apiSession
    }

    func getTrees() {
        getTrees()
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Handle error:", error)
                case .finished:
                    break
                }
            }) { result in
                self.treeViewModels = result.features
                    .map { TreeViewModel(tree: $0) }
            }
            .store(in: &cancellables)
    }
}

// MARK: Preview Content

extension TreeListViewModel {
    static var preview: TreeListViewModel {
        TreeListViewModel(apiSession: Environment.local.apiSession)
    }
}
