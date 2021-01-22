import SwiftUI

struct HeritageTreeListItem: View {
    @ObservedObject var viewModel: HeritageTreeViewModel

    var body: some View {
        HStack {
            Text(viewModel.id)
            Text(viewModel.commonName)
            Spacer()

            if viewModel.isVisited {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.gray)
            }
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
