import Combine

class HeritageTreeListViewModel: ObservableObject, OpenDataService {
    let apiSession: APIService
    @Published var treeViewModels = [HeritageTreeViewModel]()

    private var cancellables = Set<AnyCancellable>()

    init(apiSession: APIService) {
        self.apiSession = apiSession
    }

    func getHeritageTrees() {
        getHeritageTrees()
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Handle error:", error)
                case .finished:
                    break
                }
            }) { result in
                self.treeViewModels = result.features
                    .map { HeritageTreeViewModel(tree: $0) }
            }
            .store(in: &cancellables)
    }
}

// MARK: Preview Content

extension HeritageTreeListViewModel {
    static var preview: HeritageTreeListViewModel {
        HeritageTreeListViewModel(apiSession: Environment.local.apiSession)
    }
}
