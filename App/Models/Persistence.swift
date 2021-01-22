import Foundation

struct Persistence {
    static func isTreeVisited(_ tree: HeritageTree) -> Bool {
        let key = userDefaultsKey(for: tree)
        return UserDefaults.standard.bool(forKey: key)
    }

    static func setTree(_ tree: HeritageTree, visited: Bool) {
        let key = userDefaultsKey(for: tree)
        UserDefaults.standard.set(visited, forKey: key)
    }

    private static func userDefaultsKey(for tree: HeritageTree) -> String {
        "tree.visited.\(tree.properties.treeID)"
    }
}
