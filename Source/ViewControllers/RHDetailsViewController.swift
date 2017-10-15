//
//  Created by Robert on 08/07/16.
//  Copyright © 2016 Robert. All rights reserved.
//

import UIKit

protocol RHDetailsViewControllerDelegate: class {
    //    func showDetailsModally(modalPresenter: UIViewController)
}

class RHDetailsViewController: RHUIViewControllerDebug {
    
    weak var delegate: RHDetailsViewControllerDelegate?
    
    override func loadView() {
        view = RHDetailsView()
    }
}

class RHDetailsView: RHUIViewDebug {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.purple
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
