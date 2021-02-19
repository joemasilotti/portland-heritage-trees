import Foundation

struct Tree: Identifiable {
    let address: String?
    let circumference: Float?
    let commonName: String
    let diameter: Int?
    let fact: String?
    let height: Int
    let id: Int
    let latitude: Double?
    let longitude: Double?
    let neighborhood: String?
    let notes: String?
    let scientificName: String
    let spread: Int?
}

// MARK: Preview Content

extension Tree {
    static var preview: Self {
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
