import SwiftUI

struct DimensionGroup: View {
    let dimensions: [Dimension]

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
            Dimension(name: "Height", value: "205 ft"),
            Dimension(name: "Missing value", value: nil),
            Dimension(name: "Spread", value: "80 ft"),
        ])
            .autosizedPreview()
    }
}
