import SwiftUI
import Toolbox

public struct DimensionGroup: View {
    private let dimensions: [Toolbox.Dimension]

    public init(dimensions: [Toolbox.Dimension]) {
        self.dimensions = dimensions
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(dimensions, id: \.name) { dimension in
                if let value = dimension.value {
                    DimensionView(name: dimension.name, value: value)
                }
            }
        }
    }
}

struct DimensionGroup_Previews: PreviewProvider {
    static var previews: some View {
        DimensionGroup(dimensions: [
            Toolbox.Dimension(name: "Height", value: "205 ft"),
            Toolbox.Dimension(name: "Missing value", value: nil),
            Toolbox.Dimension(name: "Spread", value: "80 ft"),
        ])
            .autosizedPreview()
    }
}
