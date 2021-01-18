import SwiftUI

struct HeritageTreeDetailView: View {
    let tree: HeritageTree

    private var presenter: HeritageTreePresenter { HeritageTreePresenter(tree: tree) }

    var body: some View {
        List {
            AttributeRow(name: "Common name", value: presenter.commonName)
            AttributeRow(name: "Scientific name", value: presenter.scientificName)
            AttributeRow(name: "Address", value: tree.properties.siteAddress)
            AttributeRow(name: "Neighborhood", value: presenter.neighborhood)
            AttributeRow(name: "Height", value: presenter.height)
            AttributeRow(name: "Spread", value: presenter.spread)
            AttributeRow(name: "Circumference", value: presenter.circumference)
            AttributeRow(name: "Diameter", value: presenter.diameter)
            AttributeRow(name: "Notes", value: presenter.notes)
            AttributeRow(name: "Tree fact", value: presenter.treeFact)
        }
        .navigationBarTitle(presenter.uniqueName, displayMode: .inline)
    }
}

private struct AttributeRow: View {
    let name: String
    let value: String?

    var body: some View {
        if let value = value {
            VStack(alignment: .leading) {
                Text(name)
                    .foregroundColor(.gray)
                    .font(.caption)
                Text(value)
            }
        }
    }
}

struct HeritageTreeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HeritageTreeDetailView(tree: HeritageTree.preview)
        }
    }
}
