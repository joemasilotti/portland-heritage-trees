import Foundation

struct HeritageTree: Codable, Identifiable {
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
