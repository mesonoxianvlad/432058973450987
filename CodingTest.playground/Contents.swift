import Foundation

// MARK: Util
protocol AlertPresenter {
    func presentYesNoAlert(title: String, message: String, onYes: @escaping () -> (), onNo: @escaping () -> ())
}

protocol VehicleListViewModelDelegate: AnyObject {
    func viewModel(_ viewModel: VehicleListViewModel, didFetchVehicleList vehiclesList: [Vehicle])
    func viewModelCloseList(_ viewModel: VehicleListViewModel)
}

struct Vehicle: Decodable {
    let name: String
}



// MARK: - Network Client

struct MockNetworkClient: NetworkClient {
    func get(endpoint: String, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        let vehicles = "[{\"name\":\"Test Vehicle\"},{\"name\":\"Other Test Vehicle\"},{\"name\":\"Some Test Vehicle\"},{\"name\":\"Another Test Vehicle\"}]".data(using: .utf8)!
        
        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 2) {
            completion(.success(vehicles))
        }
    }
}

protocol NetworkClient {
    func get(endpoint: String, completion: @escaping (Result<Data, NetworkError>) -> Void)
}

struct NetworkError: Error {
    let code: Int
}

struct ServiceError: Error {
    let message: String
}


// MARK: - Vehicle Service

struct VehiclesService: VehicleListService {
    let client: NetworkClient
    let vehiclesEndpoint = "https://test.com"
    
    init(client: NetworkClient) {
        self.client = client
    }
    
    // Use the client to get the vehicles from the `vehiclesEndpoint`
    // If success, complete with the vehicles.
    // If failure, complete with an appropriate `ServerError`
    func fetchVehicles(_ completion: @escaping (Result<[Vehicle], ServiceError>) -> ()) {
        
    }
}

protocol VehicleListService {
    var client: NetworkClient { get }
    
    func fetchVehicles(_ completion: @escaping (Result<[Vehicle], ServiceError>) -> ())
}



// MARK: - ViewModel

enum LoadingState {
    case loading
    case normal
}

class VehicleListViewModel {
    private let alertPresenter: AlertPresenter
    private let vehiclesService: VehicleListService
    var updateLoadingState: ((LoadingState) -> Void)?
    weak var delegate: VehicleListViewModelDelegate?
    private let errorTitle = "Error!"
    private let errorMessage = "We were not able to fetch vehicles list. Do you want to try again?\n(Error code: %d)"
    
    init(
        alertPresenter: AlertPresenter,
        vehiclesService: VehicleListService
    ) {
        self.alertPresenter = alertPresenter
        self.vehiclesService = vehiclesService
    }
    
    // 1. Update loading state
    // 2. fetch vehicles from service
    //  3.a. If succeeded, sort the vehicles names in alphabetic order, and notify the delegate
    //  3.b. If failure, show an alert with the `errorTitle` and `errorMessage` that shows the error code.
    //      3.b.i. If the user selects yes, retry fetch,
    //      3.b.ii If the user selects no, notify the delegate to close the vehicle list.
    func fetchVehicles() {
        
    }
}
