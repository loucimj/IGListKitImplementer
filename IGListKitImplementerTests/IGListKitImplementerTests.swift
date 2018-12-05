//
//  IGListKitImplementerTests.swift
//  IGListKitImplementerTests
//
//  Created by Javier Loucim on 10/09/2018.
//  Copyright © 2018 Qeeptouch. All rights reserved.
//

import XCTest

@testable import IGListKitImplementer
@testable import IGListKit

class IGListKitImplementerTests: XCTestCase, IGListKitImplementerTester {
    
    var viewController:ViewController!
    var collectionView:UICollectionView?
    
    func prepareTestElements() -> [String] {
        return ["mi caso de test1", "mi caso de test2"]
    }
    
    override func setUp() {
        super.setUp()
        
        viewController = ViewController.initFromStoryboard()
        viewController.loadViewIfNeeded()
        for view in viewController.view.subviews {
            if view is UICollectionView {
                self.collectionView = view as? UICollectionView
            }
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testImplementations() {
        guard let _ = viewController as? IGListKitSelectionDelegate else {
            XCTAssertTrue(false)
            return
        }
        guard let viewController2 = viewController as? IGListKitImplementer else {
            XCTAssertTrue(false)
            return
        }
        
        XCTAssertTrue(true)
        
    }
    
    func testElements() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let validation = expectation(description: "Async Test")

        viewController.titles = prepareTestElements()
        viewController.prepareDataForAdapter()
        viewController.reloadData(completionBlock: { completed in
            XCTAssertTrue(self.collectionView!.numberOfSections == 2)
            validation.fulfill()
        })
        self.waitForExpectations(timeout: 10) { error in
            
        }
    }
    func testDisplayingFourElements() {
        let objects = [
            "test1" as ListDiffable,
            "test2" as ListDiffable,
            "test3" as ListDiffable,
            "test4" as ListDiffable
        ]
        XCTAssertEqual(testInjectAndGetQuantity(implementer: viewController! as! IGListKitImplementer, objects: objects), objects.count)
    }
    func testInjectAndGetQuantity(implementer: IGListKitImplementer, objects: [ListDiffable]) -> Int {
        injectData(viewController: implementer, data: objects)
        return getQuantityOfObjectsRendered(viewController: implementer)
    }
}
