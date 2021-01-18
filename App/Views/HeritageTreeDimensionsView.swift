import SwiftUI

struct HeritageTreeDimensionsView: View {
    let viewModel: HeritageTreeViewModel

    var body: some View {
        HStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 16) {
                if let height = viewModel.height {
                    DimensionView(name: "Height", value: height, color: .gray)
                }
                if let spread = viewModel.spread {
                    DimensionView(name: "Spread", value: spread, color: .gray)
                }
            }

            Spacer()

            VStack(alignment: .leading, spacing: 16) {
                if let diameter = viewModel.diameter {
                    DimensionView(name: "Diameter", value: diameter, color: .gray)
                }
                if let circumference = viewModel.circumference {
                    DimensionView(name: "Circumference", value: circumference, color: .gray)
                }
            }
        }
        .padding(.trailing)
    }
}

private struct DimensionView: View {
    let name: String
    let value: String
    let color: Color

    var body: some View {
        HStack(spacing: 16) {
            Image(name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 32)
                .padding(8)
                .background(color)
                .cornerRadius(10)
            VStack(alignment: .leading) {
                Text(name)
                    .font(.caption)
                    .bold()
                    .foregroundColor(.gray)
                Text(value)
                    .font(.title2)
                    .bold()
            }
        }
    }
}

struct HeritageTreeDimensionsView_Previews: PreviewProvider {
    static var previews: some View {
        HeritageTreeDimensionsView(viewModel: HeritageTreeViewModel.preview)
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
    }
}
