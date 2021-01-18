import MapKit

struct HeritageTreeViewModel: Identifiable {
    let tree: HeritageTree

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
}

// MARK: Preview Content

extension HeritageTreeViewModel {
    static var preview: Self {
        Self(tree: HeritageTree.preview)
    }
}
