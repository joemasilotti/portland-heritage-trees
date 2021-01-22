import MapKit
import SwiftUI

struct HeritageTreeMapAnnotationContent: View {
    var body: some View {
        Image("Tree")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 30)
            .foregroundColor(.mutedText)
    }
}
