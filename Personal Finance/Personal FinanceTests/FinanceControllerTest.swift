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

    func testAddCategory()
    {
        XCTAssertTrue(FinanceController.AddCategory("c1", _catType: PlanType.Expense))
    }

    func testDeleteCategory(_id:Int) -> Bool
    {
        let cat = CategoryManager.GetCategoryById(_id)

        let res = CategoryManager.DeleteCategory(cat)

        return res
    }

    func testGetCategoriesByType(_type:PlanType) -> [CategoryItem]
    {

        return CategoryManager.GetCategoryByType(_type)
    }

    func testGetCategoryById(_catId:Int) -> CategoryItem
    {
        return CategoryManager.GetCategoryById(_catId)
    }

    func testAddPlan(_name:String,_amount:Double,_repeatitiontype:PlanRepetitionType,
                        _repeatNumber:Int,_firstDate:NSDate,_cat:CategoryItem) -> Bool
    {
        let newPlan = PlanItem()
        newPlan.Name = _name
        newPlan.Amount = _amount
        newPlan.RepeatitionType = _repeatitiontype
        newPlan.RepeatNumber = _repeatNumber
        newPlan.FirstTimeDate = _firstDate

        newPlan.PlanCategory = _cat

        if PlanManager.AddPlan(newPlan)
        {
            return true
        }
        return false
    }


    func testGetExpenseTotalEstimateAmountInCategory(_unitl:NSDate) -> [String:Double]
    {
        let totalExpense = AccountManager.GetTotalStimatedExpenenInCategory(_unitl)

        return totalExpense

    }

    func testGetIncomeTotalEstimateAmountInCategory(_unitl:NSDate) -> [String:Double]
    {
        let totalIncomes = AccountManager.GetTotalStimatedIncomeInCategory(_unitl)

        return totalIncomes
    }

    func testGetTotalEstimateBalance(_until:NSDate) -> Double
    {
        let estimatedBalance = AccountManager.GetEstimateAccountBalance(_until)
        
        return estimatedBalance
    }
    
    func testUpdateAllList()
    {
        PlanManager.UpdatePlans()
        
        CategoryManager.UpdateCategories()
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
