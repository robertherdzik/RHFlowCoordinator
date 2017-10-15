//
//  Created by Robert on 08/07/16.
//  Copyright © 2016 Robert. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navController: RHCustomNavigationController!
    var flowCoordinator: RHMainFlowCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        navController = RHCustomNavigationController()
        
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        flowCoordinator = RHMainFlowCoordinator(withNavController: navController)
        flowCoordinator.start()
    
        return true
    }
}

