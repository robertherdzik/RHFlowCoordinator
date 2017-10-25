//
//  Created by Robert on 14/10/16.
//  Copyright © 2016 Robert. All rights reserved.
//

protocol RHFlowCoordinatorBaseProtocol: class {
 
    weak var delegate: RHFlowCoordinatorDelegate? { get set }
    unowned var navController: RHCustomNavigationController { get }
    var childCoordinators: [RHFlowCoordinatorBaseProtocol] { get set }
    
    func bindPopNavigationCallback()
    
    func add(coordinator: RHFlowCoordinatorBaseProtocol)
    func remove(coordinator: RHFlowCoordinatorBaseProtocol)
}

extension RHFlowCoordinatorBaseProtocol {
    
    func add(coordinator: RHFlowCoordinatorBaseProtocol) {
        childCoordinators.append(coordinator)
    }
    
    func remove(coordinator: RHFlowCoordinatorBaseProtocol) {
//        childCoordinators = childCoordinators.filter({ $0 === coordinator} )
        var indexToRemove: Int?
        for index in 0..<childCoordinators.count {
            let currentCoordinator = childCoordinators[index]
            if currentCoordinator === coordinator {
                print("🚨")
                indexToRemove = index
            }
        }
        
        if let indexToRemove = indexToRemove {
            childCoordinators.remove(at: indexToRemove)
        }
    }
    
    func bindPopNavigationCallback() {
        navController.willPopViewControllerCallback = { [weak self] in
            guard let sSelf = self else { return }
            
            sSelf.delegate?.workDone(withCoordinator: sSelf)
        }
    }
}
