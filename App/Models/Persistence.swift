import Foundation

struct Persistence {
    static var isVisitedStatuses: [Int: Bool] {
        get {
            UserDefaults.standard.data(forKey: "trees.visited")
                .flatMap { try? JSONDecoder().decode([Int: Bool].self, from: $0) } ?? [:]
        }
        set {
            UserDefaults.standard.set(try? JSONEncoder().encode(newValue), forKey: isVisitedStatusesKey)
        }
    }

    private static let isVisitedStatusesKey = "trees.visited"
}
