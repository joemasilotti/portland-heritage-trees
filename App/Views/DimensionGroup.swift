import Model
import SwiftUI

struct DimensionGroup: View {
    let dimensions: [Model.Dimension]

    var body: some View {
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
            Model.Dimension(name: "Height", value: "205 ft"),
            Model.Dimension(name: "Missing value", value: nil),
            Model.Dimension(name: "Spread", value: "80 ft"),
        ])
            .autosizedPreview()
    }
}
