import Model
import SwiftUI

struct TreeDimensionsView: View {
    let height: String?
    let spread: String?
    let diameter: String?
    let circumference: String?

    var body: some View {
        HStack(spacing: 16) {
            DimensionGroup(dimensions: [
                Model.Dimension(name: "Height", value: height),
                Model.Dimension(name: "Spread", value: spread)
            ])

            Spacer()

            DimensionGroup(dimensions: [
                Model.Dimension(name: "Diameter", value: diameter),
                Model.Dimension(name: "Circumference", value: circumference)
            ])
        }
        .padding(.trailing)
    }
}

struct TreeDimensionsView_Previews: PreviewProvider {
    static var previews: some View {
        TreeDimensionsView(height: "85 ft", spread: "107 ft", diameter: "48 in", circumference: "12.8 in")
            .autosizedPreview()
    }
}
