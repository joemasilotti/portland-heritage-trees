extension HeritageTree {
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

extension HeritageTree.Properties {
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
