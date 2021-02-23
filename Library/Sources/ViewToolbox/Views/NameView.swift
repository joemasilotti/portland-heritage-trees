import SwiftUI
import Toolbox

public struct NameView: View {
    private let url: URL?
    private let title: String
    private let subtitle: String
    @State private var showingSafari = false

    public init(url: URL?, title: String, subtitle: String) {
        self.url = url
        self.title = title
        self.subtitle = subtitle
    }

    public var body: some View {
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
                .foregroundColor(Colors.secondaryText)
        }
    }
}

struct TreeNameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView(url: URL.example, title: "American Elm", subtitle: "Ulmus americana")
            .autosizedPreview()
    }
}
