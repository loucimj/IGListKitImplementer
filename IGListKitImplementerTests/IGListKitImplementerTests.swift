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
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDisplayingFourElements() {
        let validation = expectation(description: "Async Test")
        let objects = [
            "test1" as ListDiffable,
            "test2" as ListDiffable,
            "test3" as ListDiffable,
            "test4" as ListDiffable
        ]
        injectData(viewController: viewController, data: objects) { completed in
            validation.fulfill()
            XCTAssertEqual(self.getQuantityOfObjectsRendered(viewController: self.viewController), objects.count)
        }
        self.waitForExpectations(timeout: 10) { error in
            
        }
    }
    func testLoader() {
        let validation = expectation(description: "Async Test")

        setInLoadingMode(viewController: viewController) { completed in
            validation.fulfill()
            XCTAssertTrue(self.isShowingLoaderView(viewController: self.viewController))
        }
        
        self.waitForExpectations(timeout: 10) { error in
            
        }
    }
    func testEmptyState() {
        let validation = expectation(description: "Async Test")
        
        setInEmptyStateMode(viewController: viewController) { completed in
            validation.fulfill()
            XCTAssertTrue(self.isShowingEmptyView(viewController: self.viewController))
        }
        
        self.waitForExpectations(timeout: 10) { error in
            
        }
    }
}
