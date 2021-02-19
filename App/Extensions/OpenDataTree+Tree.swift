extension OpenDataTree {
    var tree: Tree {
        Tree(
            address: properties.siteAddress,
            circumference: properties.circumf,
            commonName: properties.common,
            diameter: properties.diameter,
            fact: properties.treeFactLong,
            height: properties.height,
            id: properties.treeID,
            latitude: properties.lat,
            longitude: properties.lon,
            neighborhood: properties.neighborhood,
            notes: properties.notes,
            scientificName: properties.scientific,
            spread: properties.spread
        )
    }
}
