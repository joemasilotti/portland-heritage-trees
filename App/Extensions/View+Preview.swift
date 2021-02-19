import SwiftUI

extension View {
    func autosizedPreview() -> some View {
        previewLayout(PreviewLayout.sizeThatFits)
            .padding()
    }
}
