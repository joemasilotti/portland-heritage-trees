import Foundation

struct WikipediaURL {
    static func search(querying query: String) -> URL? {
        guard let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        else { return nil }

        return URL(string: "https://en.wikipedia.org/wiki/Special:Search?search=\(encodedQuery)")
    }
}
