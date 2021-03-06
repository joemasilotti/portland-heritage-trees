public enum Environment {
    case local, remote
}

extension Environment {
    public var apiService: APIService {
        switch self {
        case .local:
            return LocalSession()
        case .remote:
            return APISession()
        }
    }
}

extension Environment {
    public var store: TreeStore {
        TreeStore(apiService: apiService)
    }
}
