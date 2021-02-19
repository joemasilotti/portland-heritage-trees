import Foundation

class TreeViewModel: ObservableObject, Identifiable {
    @Published var isVisited: Bool
    let tree: Tree
    var address: String? { tree.address }
    var commonName: String { tree.commonName }
    var height: String? { "\(tree.height) ft" }
    var id: String { String(tree.id) }
    var neighborhood: String? { tree.neighborhood?.capitalized }
    var notes: String? { tree.notes }
    var scientificName: String { tree.scientificName }
    var treeFact: String? { tree.fact }
    var uniqueName: String { "Tree #\(id)" }
    var visitedButtonImageName: String { isVisited ? "checkmark.circle.fill" : "checkmark.circle" }
    var visitedButtonText: String { isVisited ? "Visited" : "Mark as visited" }
    var wikipediaURL: URL? { WikipediaURL.search(querying: commonName) }

    var circumference: String? {
        guard let circumference = tree.circumference else { return nil }
        return "\(circumference) in"
    }

    var diameter: String? {
        guard let diameter = tree.diameter else { return nil }
        return "\(diameter) in"
    }

    var spread: String? {
        guard let spread = tree.spread else { return nil }
        return "\(spread) ft"
    }

    init(tree: Tree) {
        self.tree = tree
        self.isVisited = Persistence.isTreeVisited(tree)
    }

    func toggleVisited() {
        let isVisited = !Persistence.isTreeVisited(tree)
        Persistence.setTree(tree, visited: isVisited)
        self.isVisited = isVisited
    }
}

// MARK: Preview Content

extension TreeViewModel {
    static var preview: TreeViewModel {
        TreeViewModel(tree: Tree.preview)
    }
}
