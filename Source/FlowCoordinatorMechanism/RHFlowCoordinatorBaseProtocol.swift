//
//  Created by Robert on 14/10/16.
//  Copyright © 2016 Robert. All rights reserved.
//

protocol RHFlowCoordinatorBaseProtocol: class {
 
    weak var delegate: RHFlowCoordinatorDelegate? { get set }
    weak var navController: RHCustomNavigationController? { get }
    var childCoordinators: [RHFlowCoordinatorBaseProtocol] { get set }
    
    func bindPopNavigationCallback()
    
    func add(coordinator: RHFlowCoordinatorBaseProtocol)
    func remove(coordinator: RHFlowCoordinatorBaseProtocol)
}

extension RHFlowCoordinatorBaseProtocol {
    
    func add(coordinator: RHFlowCoordinatorBaseProtocol) {
        childCoordinators += coordinator
    }
    
    func remove(coordinator: RHFlowCoordinatorBaseProtocol) {
        childCoordinators -= coordinator
    }
    
    func bindPopNavigationCallback() {
        navController?.willPopViewControllerCallback = { [weak self] in
            guard let sSelf = self else { return }
            
            sSelf.delegate?.workDone(withCoordinator: sSelf)
        }
    }
}
