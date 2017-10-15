//
//  Created by Robert on 08/07/16.
//  Copyright © 2016 Robert. All rights reserved.
//

import UIKit

class RHDetailsFlowCoordinator: RHBaseFlowCoordinator, RHFlowControllerStartProtocol {

    fileprivate var detailModalPresenter: RHDetailModalPresenter<RHDetailsViewController>?
    
    func start() {
        detailModalPresenter = RHDetailModalPresenter()
        detailModalPresenter?.present(on: navController)
        detailModalPresenter?.dismissCallback = { [weak self] in
            guard let sSelf = self else { return }
            
            sSelf.delegate?.workDone(withCoordinator: sSelf)
        }
    }
}

extension RHDetailsFlowCoordinator: RHDetailsViewControllerDelegate {
    
}

protocol RHModalPresenterProtocol {
    var dismissCallback: (()->())? { get set }
    func present(on navController: RHCustomNavigationController?)
}

class RHDetailModalPresenter<T> : RHObjectDebug, RHModalPresenterProtocol where T: UIViewController {
    
    fileprivate var viewController: T?
    var dismissCallback: (()->())?
    
    func present(on navController: RHCustomNavigationController?) {
        guard let navController = navController,
            let presenterVC = navController.viewControllers.last else { return }
        
        viewController = T()
        let leftButton = UIBarButtonItem(barButtonSystemItem: .cancel,
                                         target: self,
                                         action: #selector(cancelTapped))
        viewController!.navigationItem.leftBarButtonItem = leftButton
        viewController!.title = "details"
        
        let modalNavigationController = RHCustomNavigationController(rootViewController: viewController!)
        presenterVC.present(modalNavigationController,
                                          animated: true,
                                          completion: nil)
    }
    
    @objc func cancelTapped() {
        viewController?.dismiss(animated: true) { [weak self] in
            self?.dismissCallback?()
        }
    }
}

protocol RHViewControllerContextBaseProtocol { }

protocol RHUIViewControllerContextable {
    init(context: RHViewControllerContextBaseProtocol)
}

//
//protocol RHViewControllerDecoratorProtocol {
//    
//}
//
//class RHViewControllerDecorator: RHViewControllerDecoratorProtocol {
//    
//}
