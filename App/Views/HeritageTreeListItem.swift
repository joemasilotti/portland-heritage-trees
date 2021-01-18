import SwiftUI

struct HeritageTreeListItem: View {
    let tree: HeritageTree

    var body: some View {
        HStack {
            Text("\(tree.treeID)")
            Text(tree.commonName)
        }
    }
}

struct HeritageTreeListItem_Previews: PreviewProvider {
    static var previews: some View {
        HeritageTreeListItem(tree: HeritageTree.preview)
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
    }
}

extension HeritageTree {
    static var preview: Self {
        HeritageTree(commonName: "American elm", treeID: 1, scientificName: "Ulmus americana")
    }
}
