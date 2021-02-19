import Combine

class TreeStore: ObservableObject, OpenDataService {
    let apiService: APIService
    @Published var trees = [TreeViewModel]()

    private var cancellable: AnyCancellable?
    private var cancellables = Set<AnyCancellable>()

    public var treeAnnotations: [TreeAnnotation] {
        trees.compactMap { TreeAnnotation(tree: $0) }
    }

    init(apiService: APIService) {
        self.apiService = apiService
        connect()
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
                self.trees = result.features
                    .map { TreeViewModel(tree: $0) }
            }
            .store(in: &cancellables)
    }

    private func connect() {
        let streams = trees.map { $0.objectWillChange }
        cancellable = Publishers.MergeMany(streams).sink { [unowned self] _ in
            self.objectWillChange.send()
        }
    }
}
