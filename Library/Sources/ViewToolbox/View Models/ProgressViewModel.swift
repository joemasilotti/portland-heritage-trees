struct ProgressViewModel {
    let completedAction: String
    let completedItemCount: Int
    let itemsName: String
    let totalItemCount: Int

    var completedCopy: String {
        "\(completedItemCount) of \(totalItemCount) \(itemsName) \(completedAction)"
    }

    var completedPercentage: Double {
        Double(completedItemCount) / Double(totalItemCount)
    }
}
