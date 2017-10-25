
class RHLoginViewPresenter {
    
    static func present(withDelegate delegate: RHLoginViewControllerDelegate, onNavigationStack navController: RHCustomNavigationController) {
        let loginVC = RHLoginViewController()
        loginVC.title = "login"
        loginVC.delegate = delegate
        
        navController.pushViewController(loginVC, animated: true)
    }
}

