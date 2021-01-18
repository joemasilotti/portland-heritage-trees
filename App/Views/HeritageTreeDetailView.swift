import SwiftUI

struct HeritageTreeDetailView: View {
    let tree: HeritageTree

    private var presenter: HeritageTreePresenter { HeritageTreePresenter(tree: tree) }

    var body: some View {
        List {
            AttributeRow(name: "Common name", value: tree.commonName)
            AttributeRow(name: "Scientific name", value: tree.scientificName)
        }
        .navigationBarTitle(presenter.name, displayMode: .inline)
    }
}

private struct AttributeRow: View {
    let name: String
    let value: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .foregroundColor(.gray)
                .font(.caption)
            Text(value)
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
