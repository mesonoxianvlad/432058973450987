import Foundation

public protocol NetworkClient {
    func get(endpoint: String, completion: @escaping (Result<Data, NetworkError>) -> Void)
}

public struct MockNetworkClient: NetworkClient {
    public func get(endpoint: String, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        let vehicles = "[{\"name\":\"Test Vehicle\"},{\"name\":\"Other Test Vehicle\"},{\"name\":\"Some Test Vehicle\"},{\"name\":\"Another Test Vehicle\"}]".data(using: .utf8)!
        
        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 2) {
            completion(.success(vehicles))
        }
    }
}

