//
//  Created by Robert on 14/10/16.
//  Copyright © 2016 Robert. All rights reserved.
//

protocol RHFlowCoordinatorDelegate: class {
    
    /**
     Each Coordinator should call this method on his delegate to inform his parent coordinator that his life no make sense anymore and he can be removed. 
     In short: his job has been done 🎉 😭
     
     - parameter coordinator: coordinator which should be removed by parent coordinator
     */
    func workDone(withCoordinator coordinator: RHFlowCoordinatorBaseProtocol)
}
