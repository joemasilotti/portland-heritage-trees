import SwiftUI

struct HeritageTreeListItem: View {
    let viewModel: HeritageTreeViewModel

    var body: some View {
        HStack {
            Text(viewModel.id)
            Text(viewModel.commonName)
        }
    }
}

struct HeritageTreeListItem_Previews: PreviewProvider {
    static var previews: some View {
        HeritageTreeListItem(viewModel: HeritageTreeViewModel.preview)
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
    }
}
