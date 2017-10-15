//
//  Created by Robert on 15/10/16.
//  Copyright © 2016 Robert. All rights reserved.
//

class RHBaseFlowCoordinator: RHObjectDebug, RHFlowCoordinatorBaseProtocol {
    
    weak var delegate: RHFlowCoordinatorDelegate?
    var childCoordinators = [RHFlowCoordinatorBaseProtocol]()
    
    fileprivate(set) weak var navController: RHCustomNavigationController?
    
    init(withNavController navController: RHCustomNavigationController?) {
        self.navController = navController
        
        super.init()
        
        bindPopNavigationCallback()
    }
}

extension RHBaseFlowCoordinator: RHFlowCoordinatorDelegate {
    
    func workDone(withCoordinator coordinator: RHFlowCoordinatorBaseProtocol) {
        remove(coordinator: coordinator)
    }
}
