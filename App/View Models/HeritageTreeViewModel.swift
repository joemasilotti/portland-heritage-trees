import Foundation

class HeritageTreeViewModel: ObservableObject, Identifiable {
    @Published var isVisited: Bool

    let tree: HeritageTree
    var address: String? { tree.properties.siteAddress }
    var commonName: String { tree.properties.common }
    var height: String? { "\(tree.properties.height) ft" }
    var id: String { String(tree.properties.treeID) }
    var neighborhood: String? { tree.properties.neighborhood?.capitalized }
    var notes: String? { tree.properties.notes }
    var scientificName: String { tree.properties.scientific }
    var treeFact: String? { tree.properties.treeFactLong }
    var uniqueName: String { "Tree #\(id)" }
    var visitedButtonImageName: String { isVisited ? "checkmark.circle.fill" : "checkmark.circle" }
    var visitedButtonText: String { isVisited ? "Visited" : "Mark as visited" }
    var wikipediaURL: URL? { WikipediaURL.search(querying: commonName) }

    var circumference: String? {
        guard let circumference = tree.properties.circumf else { return nil }
        return "\(circumference) in"
    }

    var diameter: String? {
        guard let diameter = tree.properties.diameter else { return nil }
        return "\(diameter) in"
    }

    var spread: String? {
        guard let spread = tree.properties.spread else { return nil }
        return "\(spread) ft"
    }

    init(tree: HeritageTree) {
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

extension HeritageTreeViewModel {
    static var preview: HeritageTreeViewModel {
        HeritageTreeViewModel(tree: HeritageTree.preview)
    }
}
