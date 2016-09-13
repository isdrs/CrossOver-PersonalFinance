//
//  FinanceController.swift
//  Personal Finance
//
//  Created by Maysam Mohsenian on 6/23/1395 AP.
//  Copyright © 1395 Mohammad Lashgarbolouk. All rights reserved.
//

import UIKit

class FinanceController{


    static func CheckBankAccountExist() -> Bool
    {
        if DBManager.GetBankAccountItem().AccountNumber == "" {
            return false
        }
        
        return true
    }


    static func AddBankAccount(_accountName:String,_accountNumber:String) -> Bool
    {
        let balance = UpdateBalance(_accountNumber)

        let updateAccount = AccountItem(_accountNumber: _accountNumber, _name: _accountName, _balance: balance)
        
        if DBManager.AddBankAccountItem(updateAccount) {
            return true
        }

        return false

    }

    static func UpdateBalance(_accountNumber:String) -> Double
    {

        return 1000.0
    }
    
    static func GetAccount() -> AccountItem {
        if  CheckBankAccountExist(){
            return DBManager.GetBankAccountItem()
        }
        
        return AccountItem()
    }


    static func GetIncomePlans() -> [PlanItem]
    {
        let incomePlans = PlanManager.GetPlansByType(PlanType.Income)

        return incomePlans
    }

    static func GetExpensePlans() -> [PlanItem]
    {
        let expensePlans = PlanManager.GetPlansByType(PlanType.Expense)

        return expensePlans
    }

    static func DeletePlan(_id:String) -> Bool
    {
        let plan = PlanItem(_id: _id)

        let res = PlanManager.DeletePlan(plan)

        return res
    }

    static func GetExpenseCategory() -> [CategoryItem]
    {
        let expenseCats = CategoryManager.GetCategoryByType(PlanType.Expense)
        return expenseCats
    }

    static func GetIncomeCategory() -> [CategoryItem]
    {
        let incomeCats = CategoryManager.GetCategoryByType(PlanType.Income)
        return incomeCats
    }

    static func AddCategory(_catName:String,_catType:PlanType) -> Bool
    {
        let cat = CategoryItem(_name: _catName, _type: _catType)

        let res = CategoryManager.AddCategory(cat)

        return res
    }
    static func DeleteCategory(_id:Int) -> Bool
    {
        let cat = CategoryManager.GetCategoryById(_id)

        let res = CategoryManager.DeleteCategory(cat)

        return res
    }

    static func GetCategoriesByType(_type:PlanType) -> [CategoryItem]
    {
      
        return CategoryManager.GetCategoryByType(_type)
    }

    static func GetCategoryById(_catId:Int) -> CategoryItem
    {
        return CategoryManager.GetCategoryById(_catId)
    }

    static func AddPlan(_name:String,_amount:Double,_repeatitiontype:PlanRepetitionType,
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

    static func GetExpenseTotalEstimateAmount(_unitl:NSDate) -> [PlanItem:Double]
    {
        let totalExpense = AccountManager.GetTotalStimatedExpenen(_unitl)

        return totalExpense

    }

    static func GetIncomeTotalEstimateAmount(_unitl:NSDate) -> [PlanItem:Double]
    {
        let totalIncomes = AccountManager.GetTotalStimatedIncome(_unitl)

        return totalIncomes
    }

    static func GetTotalEstimateBalance(_until:NSDate) -> Double
    {
        let estimatedBalance = AccountManager.GetEstimateAccountBalance(_until)

        return estimatedBalance
    }

    static func UpdateAllList()
    {
        PlanManager.UpdatePlans()

        CategoryManager.UpdateCategories()
    }

}




















