//
//  ElementSectionController.swift
//  IGListKitImplementer
//
//  Created by Javier Loucim on 10/09/2018.
//  Copyright © 2018 Qeeptouch. All rights reserved.
//

import Foundation
import IGListKit

protocol ElementSectionControllerDelegate {
    func userHasSelectedElement(element:String)
}

class ElementSectionController: ListSectionController {
    
    convenience init(delegate: ElementSectionControllerDelegate) {
        self.init()
        self.delegate = delegate
    }
    
    var data:String?
    var delegate:ElementSectionControllerDelegate?
    
    override func sizeForItem(at index: Int) -> CGSize {
        let width = collectionContext!.containerSize.width
        let height = ElementCollectionViewCell.calculateHeight()
        return CGSize(width: width, height: height)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        
        let cell = collectionContext!.dequeueReusableCell(withNibName: "ElementCollectionViewCell", bundle: Bundle.main, for: self, at: index) as! ElementCollectionViewCell
        if let data = self.data {
            cell.configure(with: data)
        }
        return cell
    }
    
    override func didUpdate(to object: Any) {
        precondition(object is String)
        self.data = object as? String
    }
    
    override func didSelectItem(at index: Int) {
        guard self.data != nil else { return }
        delegate?.userHasSelectedElement(element: self.data!)
    }
    
}

