//
//  IGListKitImplementerTester.swift
//  IGListKitImplementer
//
//  Created by Javier Loucim on 05/12/2018.
//  Copyright © 2018 Qeeptouch. All rights reserved.
//
import Foundation
import IGListKit

protocol IGListKitImplementerTester {
    
}
extension IGListKitImplementerTester {
    func injectData(viewController: IGListKitImplementer, data: [ListDiffable]) {
        viewController.data = data
        viewController.reloadData()
    }
    func getQuantityOfObjectsRendered(viewController: IGListKitImplementer) -> Int {
        var totalItems = 0
        for sectionId in 0...viewController.collectionView.numberOfSections {
            totalItems += viewController.collectionView.numberOfItems(inSection: sectionId)
        }
        return totalItems
    }
}
