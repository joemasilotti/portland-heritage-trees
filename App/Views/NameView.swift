import SwiftUI

struct NameView: View {
    let url: URL?
    let title: String
    let subtitle: String

    @State private var showingSafari = false

    var body: some View {
        if let url = url {
            SafariButton(url: url) {
                content
            }
        } else {
            content
        }
    }

    private var content: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
            Text(subtitle)
                .font(.title3)
                .foregroundColor(.mutedText)
        }
    }
}

struct TreeNameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView(url: URL.example, title: "American Elm", subtitle: "Ulmus americana")
            .autosizedPreview()
    }
}
