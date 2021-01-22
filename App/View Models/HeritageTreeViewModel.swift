import MapKit

class HeritageTreeViewModel: ObservableObject, Identifiable {
    let tree: HeritageTree

    @Published var isVisited: Bool

    var id: String { String(tree.properties.treeID) }
    var uniqueName: String { "Tree #\(id)" }
    var commonName: String { tree.properties.common }
    var scientificName: String { tree.properties.scientific }
    var address: String? { tree.properties.siteAddress }
    var neighborhood: String? { tree.properties.neighborhood?.capitalized }
    var notes: String? { tree.properties.notes }
    var height: String? { "\(tree.properties.height) ft" }
    var treeFact: String? { tree.properties.treeFactLong }
    var mappableViewModel: MappableHeritageTreeViewModel? { MappableHeritageTreeViewModel(tree: tree) }
    var visitedButtonImageName: String { isVisited ? "checkmark.circle.fill" : "checkmark.circle" }
    var visitedButtonText: String { isVisited ? "Visited" : "Mark as visited" }

    var spread: String? {
        guard let spread = tree.properties.spread else { return nil }
        return "\(spread) ft"
    }

    var diameter: String? {
        guard let diameter = tree.properties.diameter else { return nil }
        return "\(diameter) in"
    }

    var circumference: String? {
        guard let circumference = tree.properties.circumf else { return nil }
        return "\(circumference) in"
    }

    var wikipediaURL: URL? {
        WikipediaURL.search(querying: commonName)
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
