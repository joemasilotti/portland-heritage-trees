import Combine

class TreeStore: ObservableObject, OpenDataService {
    @Published private(set) var treeAnnotations = [TreeAnnotation]()
    let apiService: APIService

    @Published private(set) var isVisitedStatuses: [Int: Bool] {
        didSet { setTreeAnnotations() }
    }

    @Published private(set) var trees = [Tree]() {
        didSet { setTreeAnnotations() }
    }

    private var cancellables = Set<AnyCancellable>()

    init(apiService: APIService) {
        self.apiService = apiService
        self.isVisitedStatuses = Persistence.isVisitedStatuses
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
                    .map { $0.tree }
            }
            .store(in: &cancellables)
    }

    func isVisited(tree: Tree) -> Bool {
        isVisitedStatuses[tree.id] ?? false
    }

    func toggleTreeIsVisited(_ tree: Tree) {
        var statuses = isVisitedStatuses
        statuses[tree.id] = !(statuses[tree.id] ?? false)
        isVisitedStatuses = statuses
        Persistence.isVisitedStatuses = isVisitedStatuses
    }

    private func setTreeAnnotations() {
        treeAnnotations = trees.compactMap { tree in
            let isVisited = isVisitedStatuses[tree.id] ?? false
            return TreeAnnotation(tree: tree, isVisited: isVisited)
        }
    }
}
