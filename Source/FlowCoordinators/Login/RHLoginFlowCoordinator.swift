//
//  Created by Robert on 08/07/16.
//  Copyright © 2016 Robert. All rights reserved.
//

class RHLoginFlowCoordinator: RHBaseFlowCoordinator, RHFlowControllerStartProtocol {
    
    func start() {
        RHLoginViewPresenter.present(withDelegate: self, onNavigationStack: navController)
    }
}

extension RHLoginFlowCoordinator: RHLoginViewControllerDelegate {
    
    func showDetails() {
        let detailsViewCoordinator = RHDetailsFlowCoordinator(withNavController: navController)
        detailsViewCoordinator.delegate = self
        detailsViewCoordinator.start()
        
        add(coordinator: detailsViewCoordinator)
    }
}
