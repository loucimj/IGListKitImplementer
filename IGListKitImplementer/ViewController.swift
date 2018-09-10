//
//  ViewController.swift
//  IGListKitImplementer
//
//  Created by Javier Loucim on 10/09/2018.
//  Copyright © 2018 Qeeptouch. All rights reserved.
//

import UIKit
import IGListKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var data:Array<ListDiffable> = Array<ListDiffable>()
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    var titles:Array<String> = Array<String>()

    class func initFromStoryboard() -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupIGListKit()
        
        getData()
        prepareDataForAdapter()
        reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
//MARK: - IGListKitImplementer
extension ViewController: IGListKitImplementer {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return data
    }
    
    func prepareDataForAdapter() {
        data.removeAll()
        for title in titles {
            data.append(title as ListDiffable)
        }
    }
    
    func getData() {
        titles.removeAll()
        titles.append("Element 1")
        titles.append("Element 2")
        titles.append("Element 3")
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is String:
            return ElementSectionController(delegate: self)
        default:
            return ListSectionController()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
//MARK: - ElementSectionControllerDelegate
extension ViewController: ElementSectionControllerDelegate {
    func userHasSelectedElement(element: String) {
        print(element)
    }
}
