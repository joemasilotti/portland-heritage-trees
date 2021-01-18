import SwiftUI

struct HeritageTreeListItem: View {
    let tree: HeritageTree

    private var presenter: HeritageTreePresenter { HeritageTreePresenter(tree: tree) }

    var body: some View {
        HStack {
            Text(presenter.id)
            Text(presenter.commonName)
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
