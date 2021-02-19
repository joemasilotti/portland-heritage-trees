import SwiftUI

struct AttributeRow: View {
    let name: String
    let value: String?

    var body: some View {
        if let value = value {
            VStack(alignment: .leading) {
                Text(name)
                    .foregroundColor(.mutedText)
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
