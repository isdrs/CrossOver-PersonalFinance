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
    
    func testUpdateAllList()
    {
        FinanceController.UpdateAllList()
        
        XCTAssert(true)
    }
    
    func testCheckBankAccountExist()  {
        
        XCTAssertTrue(FinanceController.CheckBankAccountExist())
    }

    func testAddBankAccount()
    {
        XCTAssertTrue(FinanceController.AddBankAccount( "CrossOver" ,_accountNumber: "123431"))
    }

    func testUpdateBalance()
    {
        XCTAssertEqual(FinanceController.UpdateBalance("123431"),AccountManager.staticBalance)
    }
    
    func testAddPlan() {
        let category = CategoryItem(_name: "TestCat2", _type: .Income)
        
        XCTAssertTrue(FinanceController.AddCategory(category.Name, _catType: category.Type))
        
        XCTAssertTrue(FinanceController.AddPlan("TestPlan", _amount: Double(114), _repeatitiontype: .Ad_hoc, _repeatNumber: 0, _firstDate: NSDate(), _cat: category))
        
    }

    func testGetAccount()  {
        XCTAssertNotNil(FinanceController.GetAccount(), "Most have account")
    }


    func testGetIncomePlans()
    {
        XCTAssertNotNil(FinanceController.GetIncomePlans(), "Most have income plans")
    }

    func testGetExpensePlans()
    {
        XCTAssertNotNil(FinanceController.GetExpensePlans(), "Most have expense plans")
    }

    func testDeletePlan()
    {
        let expensePlans = FinanceController.GetExpensePlans()
        
        let incomePlans = FinanceController.GetIncomePlans()
        
        if expensePlans.count > 0 {
            XCTAssertTrue(FinanceController.DeletePlan(expensePlans[0].ID))
        }
        else if incomePlans.count > 0
        {
            XCTAssertTrue(FinanceController.DeletePlan(incomePlans[0].ID))
        }
        else
        {
            XCTAssert(true, "No plan found to delete")
        }
    }

    func testGetExpenseCategory()
    {
        XCTAssertNotNil(FinanceController.GetCategoriesByType(.Expense), "Most have expense categories")
    }

    func testGetIncomeCategory()
    {
        XCTAssertNotNil(FinanceController.GetCategoriesByType(.Income), "Most have expense categories")
    }


    func testDeleteCategory()
    {
        
        let expenseCats = FinanceController.GetCategoriesByType(.Expense)
        
        let incomeCats = FinanceController.GetCategoriesByType(.Income)
        
        if expenseCats.count > 0 {
            XCTAssertTrue(FinanceController.DeleteCategory(expenseCats[0].ID))
        }
        else if incomeCats.count > 0
        {
            XCTAssertTrue(FinanceController.DeleteCategory(incomeCats[0].ID))
        }
        else
        {
            XCTAssert(true, "No category found to delete")
        }
    }
}
