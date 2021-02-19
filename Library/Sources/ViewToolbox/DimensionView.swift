import SwiftUI

struct DimensionView: View {
    let name: String
    let value: String

    var body: some View {
        HStack(spacing: 16) {
            Image(name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 28)
                .padding(10)
                .foregroundColor(.white)
                .background(Color.accentColor)
                .cornerRadius(10)
            VStack(alignment: .leading) {
                Text(name)
                    .font(.caption)
                    .bold()
                    .foregroundColor(Colors.secondaryText)
                Text(value)
                    .font(.title2)
                    .bold()
            }
        }
    }
}

struct DimensionView_Previews: PreviewProvider {
    static var previews: some View {
        DimensionView(name: "Height", value: "85 ft")
            .autosizedPreview()
    }
}
