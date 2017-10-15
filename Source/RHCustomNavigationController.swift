//  Created by Robert on 08/07/16.
//  Copyright © 2016 Robert. All rights reserved.
//

import UIKit

class RHCustomNavigationController: UINavigationController {

    var willPopViewControllerCallback: (() -> ())?
    
    override func popViewController(animated: Bool) -> UIViewController? {
        willPopViewControllerCallback?()
        
        let viewControllers = super.popViewController(animated: animated)
        
        return viewControllers
    }
    
    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        willPopViewControllerCallback?()
        
        let viewControllers = super.popToRootViewController(animated: animated)
        
        return viewControllers
    }
}
