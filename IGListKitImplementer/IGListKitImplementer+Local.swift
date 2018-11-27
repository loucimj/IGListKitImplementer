//
//  IGListKitImplementer+Local.swift
//  IGListKitImplementer
//
//  Created by Javier Loucim on 27/11/2018.
//  Copyright © 2018 Qeeptouch. All rights reserved.
//

import Foundation
import IGListKit

protocol IGListKitSelectionDelegate {
    func userHasSelectedObject(object:Any)
}

extension IGListKitImplementer {
    func getListSectionController(for object:Any, delegate:IGListKitSelectionDelegate) -> ListSectionController? {
        switch object {
        case is String:
            return ElementSectionController(delegate: delegate)
        default:
            return nil
        }
    }
}
