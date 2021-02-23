import Model
import SwiftUI
import ViewToolbox

struct VisitedTreesProgressView: View {
    @EnvironmentObject var store: TreeStore

    var body: some View {
        CompletedProgressView(
            completedAction: "visited",
            completedItemCount: store.visitedTreeCount,
            itemsName: "trees",
            totalItemCount: store.treeCount
        )
    }
}
