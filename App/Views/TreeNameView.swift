import SwiftUI

struct TreeNameView: View {
    let viewModel: TreeViewModel

    @State private var showingSafari = false

    var body: some View {
        if let url = viewModel.wikipediaURL {
            Button(action: { showingSafari = true }) {
                HStack {
                    content
                    Spacer()
                    Image(systemName: "arrow.up.forward.app")
                        .foregroundColor(.gray)
                }
            }
            .sheet(isPresented: $showingSafari) {
                SafariView(url: url)
            }
        } else {
            content
        }
    }

    private var content: some View {
        VStack(alignment: .leading) {
            Text(viewModel.commonName)
                .font(.title)
            Text(viewModel.scientificName)
                .font(.title3)
                .foregroundColor(.mutedText)
        }
    }
}

struct TreeNameView_Previews: PreviewProvider {
    static var previews: some View {
        TreeNameView(viewModel: TreeViewModel.preview)
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
    }
}
