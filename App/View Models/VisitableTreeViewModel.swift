import Model

class VisitableTreeViewModel: TreeViewModel {
    let isVisited: Bool
    var visitedButtonImageName: String { isVisited ? "checkmark.circle.fill" : "checkmark.circle" }
    var visitedButtonText: String { isVisited ? "Visited" : "Mark as visited" }

    init(tree: Tree, isVisited: Bool) {
        self.isVisited = isVisited
        super.init(tree: tree)
    }
}
