import Combine

public class TreeStore: ObservableObject, OpenDataService {
    @Published public private(set) var treeAnnotations = [TreeAnnotation]()
    let apiService: APIService

    @Published public private(set) var trees = [Tree]() {
        didSet { setTreeAnnotations() }
    }

    @Published private(set) var isVisitedStatuses: [Int: Bool] {
        didSet { setTreeAnnotations() }
    }

    private var cancellables = Set<AnyCancellable>()

    public init(apiService: APIService) {
        self.apiService = apiService
        self.isVisitedStatuses = Persistence.isVisitedStatuses
        getTrees()
    }

    public func isVisited(tree: Tree) -> Bool {
        isVisitedStatuses[tree.id] ?? false
    }

    public func toggleTreeIsVisited(_ tree: Tree) {
        var statuses = isVisitedStatuses
        statuses[tree.id] = !(statuses[tree.id] ?? false)
        isVisitedStatuses = statuses
        Persistence.isVisitedStatuses = isVisitedStatuses
    }

    private func getTrees() {
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

    private func setTreeAnnotations() {
        treeAnnotations = trees.compactMap { tree in
            let isVisited = isVisitedStatuses[tree.id] ?? false
            return TreeAnnotation(tree: tree, isVisited: isVisited)
        }
    }
}
