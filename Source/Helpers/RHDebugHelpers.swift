import UIKit

class RHUIViewControllerDebug: UIViewController {
    
    deinit {
        print("🌶 VC 💥 DEINIT vc \(type(of: self))")
    }
}

class RHUIViewDebug: UIView {
    
    deinit {
        print("💥 DEINIT view \(type(of: self))")
    }
}

class RHObjectDebug {
    
    deinit {
        print("💥 DEINIT obj \(type(of: self))")
    }
}
