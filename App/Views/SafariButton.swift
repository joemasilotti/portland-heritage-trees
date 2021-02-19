import SwiftUI

struct SafariButton<Content: View>: View {
    let content: Content
    let url: URL

    @State private var showingSafari = false

    init(url: URL, @ViewBuilder content: () -> Content) {
        self.url = url
        self.content = content()
    }

    var body: some View {
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
    }
}

struct SafariButton_Previews: PreviewProvider {
    static var previews: some View {
        SafariButton(url: URL.example) {
            Text("Show me the Safari")
        }
        .autosizedPreview()
    }
}
