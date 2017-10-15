
/**
 Method for adding new coordinators to coordinators array
 
 - parameter l: Array of coordinators
 - parameter r: Coordinator which you want to add
 */
func +=(l: inout [RHFlowCoordinatorBaseProtocol], r: RHFlowCoordinatorBaseProtocol) {
    l.append(r)
}

/**
 Method for removing coordinators
 
 - parameter l: Array of coordinators
 - parameter r: Coordinator which you want to remove
 */
func -=(l: inout [RHFlowCoordinatorBaseProtocol], r: RHFlowCoordinatorBaseProtocol) {
    let indexToRemove = l.index { $0 === r }
    
    if let indexToRemove = indexToRemove {
        l.remove(at: indexToRemove)
    }
}
