//
//  FinanceControllerTest.swift
//  Personal Finance
//
//  Created by Admin on ۱۳۹۵/۶/۲۳ ه‍.ش..
//  Copyright © ۱۳۹۵ ه‍.ش. Mohammad Lashgarbolouk. All rights reserved.
//

import XCTest
@testable import Personal_Finance

class FinanceControllerTest: XCTestCase {
    
    func testCheckBankAccountExist()  {
        
        XCTAssertTrue(FinanceController.CheckBankAccountExist())
    }
    
    func testAddCategory()
    {
        XCTAssertTrue(FinanceController.AddCategory("TestCat", _catType: PlanType.Expense))
    }


    func testAddBankAccount()
    {
        XCTAssertTrue(FinanceController.AddBankAccount( "CrossOver" ,_accountNumber: "123431"))
    }

    func testUpdateBalance()
    {
        XCTAssertEqual(FinanceController.UpdateBalance("123431"),AccountManager.staticBalance)
    }

//    func testGetAccount()  {
//
//    }


//    func testGetIncomePlans()
//    {
//        let incomePlans = PlanManager.GetPlansByType(PlanType.Income)
//
//        return incomePlans
//    }

//    func testGetExpensePlans()
//    {
//        let expensePlans = PlanManager.GetPlansByType(PlanType.Expense)
//
//        return expensePlans
//    }

    func testDeletePlan()
    {
        XCTAssertTrue(FinanceController.DeletePlan("1232322"))

    }

//    func testGetExpenseCategory()
//    {
//        let expenseCats = CategoryManager.GetCategoryByType(PlanType.Expense)
//        return expenseCats
//    }

//    func testGetIncomeCategory()
//    {
//        let incomeCats = CategoryManager.GetCategoryByType(PlanType.Income)
//        return incomeCats
//    }


    func testDeleteCategory()
    {
        XCTAssertTrue(FinanceController.DeleteCategory(12))
    }

    func testGetCategoriesByType(_type:PlanType) -> [CategoryItem]
    {

        return CategoryManager.GetCategoryByType(_type)
    }

    func testGetCategoryById(_catId:Int) -> CategoryItem
    {
        return CategoryManager.GetCategoryById(_catId)
    }

    func testAddPlan()
    {
        XCTAssertTrue(FinanceController.AddPlan("P1", _amount: 150, _repeatitiontype: PlanRepetitionType.Recurring, _repeatNumber: 5, _firstDate: NSDate(), _cat: CategoryItem(_id: 12, _name: "c1", _type: PlanType.Income)))
    }



    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    

    
}
