enum Environment {
    case local, remote
}

extension Environment {
    var apiSession: APIService {
        switch self {
        case .local:
            return LocalSession()
        case .remote:
            return APISession()
        }
    }
}
