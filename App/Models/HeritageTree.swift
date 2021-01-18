import Foundation

struct HeritageTree: Codable, Identifiable {
    let id = UUID()
    var commonName: String { properties.common }
    var scientificName: String { properties.scientific }
    var treeID: Int { properties.treeID }

    private let properties: Properties

    init(commonName: String, treeID: Int, scientificName: String) {
        self.properties = Properties(treeID: treeID, common: commonName, scientific: scientificName)
    }

    enum CodingKeys: String, CodingKey {
        case properties
    }

    struct Properties: Codable {
        let treeID: Int
        let common: String
        let scientific: String

        enum CodingKeys: String, CodingKey {
            case common = "COMMON"
            case treeID = "TREEID"
            case scientific = "SCIENTIFIC"
        }
    }
}
