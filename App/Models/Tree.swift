import Foundation

struct Tree: Codable, Identifiable {
    let id = UUID()
    let properties: Properties

    enum CodingKeys: String, CodingKey {
        case properties
    }

    struct Properties: Codable {
        let treeID: Int
        let scientific: String
        let common: String
        let siteAddress: String?
        let height: Int
        let spread: Int?
        let circumf: Float?
        let diameter: Int?
        let yearDesignated: Int?
        let notes: String?
        let lat: Double?
        let lon: Double?
        let neighborhood: String?
        let treeFactLong: String?

        enum CodingKeys: String, CodingKey {
            case treeID = "TREEID"
            case common = "COMMON"
            case scientific = "SCIENTIFIC"
            case siteAddress = "SITE_ADDRESS"
            case height = "HEIGHT"
            case spread = "SPREAD"
            case circumf = "CIRCUMF"
            case diameter = "DIAMETER"
            case yearDesignated = "YEAR_Designated"
            case notes = "NOTES"
            case lat = "LAT"
            case lon = "LON"
            case neighborhood = "Neighborhood"
            case treeFactLong = "Tree_fact_long"
        }
    }
}

// MARK: Preview Content

extension Tree {
    static var preview: Self {
        Self(properties: Properties(
            treeID: 1,
            scientific: "Ulmus americana",
            common: "American elm", siteAddress: "1111 SW 10th AVE",
            height: 85,
            spread: 107,
            circumf: 12.8,
            diameter: 48,
            yearDesignated: 1973,
            notes: "This tree was planted in front of the home of Martin and Rosetta Burrell in 1870 and is thus known as the 'Burrell Elm'.",
            lat: 45.51672923,
            lon: -122.68401382,
            neighborhood: "DOWNTOWN",
            treeFactLong: "The Burrell Elm is the second historic tree recognized by the City of Portland. It is an American Elm tree that was planted in 1870 at the home of Martin and Rosetta Burrell, in what was their private garden at the time. As Portland grew, the character of the neighborhood changed from private single-family homes to denser development. This elm tree is now behind the sidewalk in front of the YWCA in downtown Portland."
        ))
    }
}

extension Tree.Properties {
    init(treeID: Int, scientific: String, common: String, height: Int) {
        self.treeID = treeID
        self.scientific = scientific
        self.common = common
        self.siteAddress = nil
        self.height = height
        self.spread = nil
        self.circumf = nil
        self.diameter = nil
        self.yearDesignated = nil
        self.notes = nil
        self.lat = nil
        self.lon = nil
        self.neighborhood = nil
        self.treeFactLong = nil
    }
}
