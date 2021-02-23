import SwiftUI

public struct CompletedProgressView: View {
    public init(completedAction: String, completedItemCount: Int, itemsName: String, totalItemCount: Int) {
        self.completedAction = completedAction
        self.completedItemCount = completedItemCount
        self.itemsName = itemsName
        self.totalItemCount = totalItemCount
    }

    public var body: some View {
        VStack {
            Text(viewModel.completedCopy)
                .font(.headline)

            ZStack(alignment: .leading) {
                GeometryReader { geometry in
                    RoundedRectangle(cornerRadius: height)
                        .foregroundColor(Color.gray.opacity(0.5))
                    RoundedRectangle(cornerRadius: height)
                        .foregroundColor(.accentColor)
                        .frame(width: filledWidth(geometry))
                }
                .frame(height: height)
            }
        }
    }

    private let completedAction: String
    private let completedItemCount: Int
    private let itemsName: String
    private let totalItemCount: Int
    private var height: CGFloat { 12 }
    private var viewModel: ProgressViewModel {
        ProgressViewModel(
            completedAction: completedAction,
            completedItemCount: completedItemCount,
            itemsName: itemsName,
            totalItemCount: totalItemCount
        )
    }

    private func filledWidth(_ geometry: GeometryProxy) -> CGFloat {
        CGFloat(viewModel.completedPercentage) * geometry.size.width
    }
}

struct VisitedProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedProgressView(
            completedAction: "visited",
            completedItemCount: 20,
            itemsName: "trees",
            totalItemCount: 100
        )
        .autosizedPreview()
    }
}
