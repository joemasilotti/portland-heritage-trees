import Foundation

struct Persistence {
    static func isTreeVisited(_ tree: Tree) -> Bool {
        let key = userDefaultsKey(for: tree)
        return UserDefaults.standard.bool(forKey: key)
    }

    static func setTree(_ tree: Tree, visited: Bool) {
        let key = userDefaultsKey(for: tree)
        UserDefaults.standard.set(visited, forKey: key)
    }

    private static func userDefaultsKey(for tree: Tree) -> String {
        "tree.visited.\(tree.properties.treeID)"
    }
}
