//
//  IGListKitImplementerTester.swift
//  IGListKitImplementer
//
//  Created by Javier Loucim on 05/12/2018.
//  Copyright © 2018 Qeeptouch. All rights reserved.
//
import Foundation
@testable import IGListKit
@testable import IGListKitImplementer

protocol IGListKitImplementerTester {
    
}
extension IGListKitImplementerTester {
    func injectData(viewController: IGListKitImplementer, data: [ListDiffable], completionBlock: ListUpdaterCompletion? = nil) {
        viewController.data = data
        viewController.reloadData(completionBlock: completionBlock)
    }
    func getQuantityOfObjectsRendered(viewController: IGListKitImplementer) -> Int {
        guard viewController.collectionView.numberOfSections > 0 else { return 0 }
        var totalItems = 0
        for sectionId in 0...viewController.collectionView.numberOfSections - 1 {
            totalItems += viewController.collectionView.numberOfItems(inSection: sectionId)
        }
        return totalItems
    }
}
