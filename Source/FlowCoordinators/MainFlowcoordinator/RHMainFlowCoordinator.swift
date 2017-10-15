//
//  Created by Robert on 08/07/16.
//  Copyright © 2016 Robert. All rights reserved.
//

class RHMainFlowCoordinator: RHBaseFlowCoordinator, RHFlowControllerStartProtocol {
    
    var firstVC: RHMainViewController?
    
    func start() {
        firstVC = RHMainViewController()
        firstVC?.title = "first"
        firstVC?.delegate = self
        
        navController?.pushViewController(firstVC!, animated: false)
    }
}

extension RHMainFlowCoordinator: RHMainViewControllerDelegate {
    
    func nextViewController() {
        let loginCoordinator = RHLoginFlowCoordinator(withNavController: navController)
        loginCoordinator.delegate = self
        loginCoordinator.start()
        
        add(coordinator: loginCoordinator)
    }
}
