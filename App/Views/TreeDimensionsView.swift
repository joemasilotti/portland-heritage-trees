import SwiftUI

struct TreeDimensionsView: View {
    let viewModel: TreeViewModel

    var body: some View {
        HStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 16) {
                if let height = viewModel.height {
                    DimensionView(name: "Height", value: height)
                }
                if let spread = viewModel.spread {
                    DimensionView(name: "Spread", value: spread)
                }
            }

            Spacer()

            VStack(alignment: .leading, spacing: 16) {
                if let diameter = viewModel.diameter {
                    DimensionView(name: "Diameter", value: diameter)
                }
                if let circumference = viewModel.circumference {
                    DimensionView(name: "Circumference", value: circumference)
                }
            }
        }
        .padding(.trailing)
    }
}

private struct DimensionView: View {
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
                    .foregroundColor(.mutedText)
                Text(value)
                    .font(.title2)
                    .bold()
            }
        }
    }
}

struct TreeDimensionsView_Previews: PreviewProvider {
    static var previews: some View {
        TreeDimensionsView(viewModel: TreeViewModel.preview)
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
    }
}
