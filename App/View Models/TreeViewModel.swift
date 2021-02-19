import Foundation

class TreeViewModel: ObservableObject, Identifiable {
    let tree: Tree
    var address: String? { tree.address }
    var commonName: String { tree.commonName }
    var height: String? { "\(tree.height) ft" }
    var id: Int { tree.id }
    var neighborhood: String? { tree.neighborhood?.capitalized }
    var notes: String? { tree.notes }
    var scientificName: String { tree.scientificName }
    var treeFact: String? { tree.fact }
    var uniqueName: String { "Tree #\(id)" }
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
    }
}

// MARK: Preview Content

extension TreeViewModel {
    static var preview: TreeViewModel {
        TreeViewModel(tree: Tree.preview)
    }
}
