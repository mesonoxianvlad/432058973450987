import Foundation



// MARK: - Vehicle Service


protocol VehicleListService {
    var client: NetworkClient { get }
    
    func fetchVehicles(_ completion: @escaping (Result<[Vehicle], ServiceError>) -> ())
}

struct VehiclesService: VehicleListService {
    let client: NetworkClient
    let vehiclesEndpoint = "https://test.com"
    
    init(client: NetworkClient) {
        self.client = client
    }
    
    // Use the client to get the vehicles from the `vehiclesEndpoint`
    // If success, complete with the vehicles.
    // If failure, complete with an appropriate `ServiceError`
    func fetchVehicles(_ completion: @escaping (Result<[Vehicle], ServiceError>) -> ()) {
        
    }
}



// MARK: - ViewModel
protocol VehicleListViewModelDelegate: AnyObject {
    func viewModel(_ viewModel: VehicleListViewModel, didFetchVehicleList vehiclesList: [Vehicle])
    func viewModelCloseList(_ viewModel: VehicleListViewModel)
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
