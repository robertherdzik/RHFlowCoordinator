//
//  Created by Robert on 08/07/16.
//  Copyright © 2016 Robert. All rights reserved.
//

import UIKit

protocol RHLoginViewControllerDelegate: class {
    func showDetails()
}

class RHLoginViewController: RHUIViewControllerDebug {

    weak var delegate: RHLoginViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        castView().button.addTarget(self,
                                    action: #selector(buttonTapped),
                                    for: .touchUpInside)
    }
    
    override func loadView() {
        view = RHLoginVCView()
    }
    
    fileprivate func castView() -> RHLoginVCView {
        return view as! RHLoginVCView
    }
    
    func buttonTapped() {
        delegate?.showDetails()
    }
}

class RHLoginVCView: RHUIViewDebug {
    
    let button = UIButton(type: .custom)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        defer {
            button.setTitle("show modally", for: UIControlState())
            button.backgroundColor = UIColor.red
            backgroundColor = UIColor.lightGray
            addSubview(button)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.center = center
    }
}
