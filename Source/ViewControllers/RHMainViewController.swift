//
//  Created by Robert on 08/07/16.
//  Copyright © 2016 Robert. All rights reserved.
//

import UIKit

protocol RHMainViewCoordinatorDelegate: class {
    func nextViewController()
}

class RHMainViewController: RHUIViewControllerDebug {
    
    weak var delegate: RHMainViewCoordinatorDelegate?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        perform(#selector(delayedNextVCAppearance),
                        with: nil,
                        afterDelay: 0.5)
    }
    
    func delayedNextVCAppearance() {
        delegate?.nextViewController()
    }
    
    override func loadView() {
        view = RHCustomView()
    }
}

class RHCustomView: RHUIViewDebug {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.green
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
