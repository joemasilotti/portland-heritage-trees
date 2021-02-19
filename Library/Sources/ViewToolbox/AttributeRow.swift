import SwiftUI

public struct AttributeRow: View {
    private let name: String
    private let value: String?

    public init(name: String, value: String?) {
        self.name = name
        self.value = value
    }

    public var body: some View {
        if let value = value {
            VStack(alignment: .leading) {
                Text(name)
                    .foregroundColor(Colors.secondaryText)
                    .font(.caption)
                Text(value)
            }
        }
    }
}

struct AttributeRow_Previews: PreviewProvider {
    static var previews: some View {
        AttributeRow(name: "Height", value: "20 meters")
            .autosizedPreview()
    }
}
