import SwiftUI

extension View {
    public func autosizedPreview() -> some View {
        previewLayout(PreviewLayout.sizeThatFits)
            .padding()
    }
}
