import Foundation

public struct Tree: Identifiable {
    public let address: String?
    public let circumference: Float?
    public let commonName: String
    public let diameter: Int?
    public let fact: String?
    public let height: Int
    public let id: Int
    public let latitude: Double?
    public let longitude: Double?
    public let neighborhood: String?
    public let notes: String?
    public let scientificName: String
    public let spread: Int?
}

// MARK: Preview Content

extension Tree {
    public static var preview: Self {
        Self(
            address: "1111 SW 10th AVE",
            circumference: 12.8,
            commonName: "American elm",
            diameter: 48,
            fact: "The Burrell Elm is the second historic tree recognized by the City of Portland.",
            height: 85,
            id: 1,
            latitude: 45.51672923,
            longitude: -122.68401382,
            neighborhood: "DOWNTOWN",
            notes: "This tree was planted in front of the home of Martin and Rosetta Burrell in 1870 and is thus known as the 'Burrell Elm'.",
            scientificName: "Ulmus americana",
            spread: 107
        )
    }
}
