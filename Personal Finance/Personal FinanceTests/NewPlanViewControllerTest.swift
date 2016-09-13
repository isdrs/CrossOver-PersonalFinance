//
//  NewPlanViewControllerTest.swift
//  Personal Finance
//
//  Created by Maysam Mohsenian on 6/23/1395 AP.
//  Copyright © 1395 Mohammad Lashgarbolouk. All rights reserved.
//

import XCTest
import UIKit


class NewPlanViewControllerTest: XCTestCase {


    var viewController : NewPlanViewController!

    override func setUp() {
        super.setUp()

        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("NewPlanViewController") as! NewPlanViewController
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    

    
}
