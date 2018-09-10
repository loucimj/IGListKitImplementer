//
//  IGListKitImplementer.swift
//  IGListKitImplementer
//
//  Created by Javier Loucim on 10/09/2018.
//  Copyright © 2018 Qeeptouch. All rights reserved.
//

import Foundation
import IGListKit
import UIKit

protocol IGListKitImplementer: ListAdapterDataSource {
    var collectionView: UICollectionView! { get set }
    var data: Array<ListDiffable> { get set }
    var adapter: ListAdapter { get set }
    
    func prepareDataForAdapter()
    func getData()
    func reloadData(completionBlock:ListUpdaterCompletion?) 
}

extension IGListKitImplementer where Self: ListAdapterDataSource {

    func setupIGListKit() {
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }
    
    func reloadData(completionBlock:ListUpdaterCompletion? = nil ) {
        adapter.performUpdates(animated: true, completion: completionBlock)
    }


}

extension IGListKitImplementer where Self: ListAdapterDataSource, Self: UIScrollViewDelegate {

    func setupIGListKit() {
        adapter.collectionView = collectionView
        adapter.dataSource = self
        adapter.scrollViewDelegate = self
    }

}
