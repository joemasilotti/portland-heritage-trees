import SwiftUI
import Toolbox

public struct DimensionsView: View {
    private let height: String?
    private let spread: String?
    private let diameter: String?
    private let circumference: String?

    public init(height: String?, spread: String?, diameter: String?, circumference: String?) {
        self.height = height
        self.spread = spread
        self.diameter = diameter
        self.circumference = circumference
    }

    public var body: some View {
        HStack(spacing: 16) {
            DimensionGroup(dimensions: [
                Toolbox.Dimension(name: "Height", value: height),
                Toolbox.Dimension(name: "Spread", value: spread)
            ])

            Spacer()

            DimensionGroup(dimensions: [
                Toolbox.Dimension(name: "Diameter", value: diameter),
                Toolbox.Dimension(name: "Circumference", value: circumference)
            ])
        }
        .padding(.trailing)
    }
}

struct DimensionsView_Previews: PreviewProvider {
    static var previews: some View {
        DimensionsView(height: "85 ft", spread: "107 ft", diameter: "48 in", circumference: "12.8 in")
            .autosizedPreview()
    }
}
