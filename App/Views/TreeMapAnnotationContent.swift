import MapKit
import SwiftUI

struct TreeMapAnnotationContent: View {
    var body: some View {
        Image("Tree")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 30)
            .foregroundColor(.mutedText)
    }
}

struct TreeMapAnnotationContent_Previews: PreviewProvider {
    static var previews: some View {
        TreeMapAnnotationContent()
            .autosizedPreview()
    }
}
