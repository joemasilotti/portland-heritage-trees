enum Environment {
    case local, remote
}

extension Environment {
    var apiService: APIService {
        switch self {
        case .local:
            return LocalSession()
        case .remote:
            return APISession()
        }
    }
}

extension Environment {
    var store: TreeStore {
        TreeStore(apiService: apiService)
    }
}
