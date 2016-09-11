//
//  ExpenseManager.swift
//  Personal Finance
//
//  Created by Maysam Mohsenian on 6/21/1395 AP.
//  Copyright © 1395 Mohammad Lashgarbolouk. All rights reserved.
//


import UIKit


class ExpenseManager: NSObject {

    static private var expensePlans: [ExpensePlan] = []

    static func AddIncomePlan(_expensePlan:ExpensePlan) -> Bool
    {
        if DBManager.AddIncomePlan(_expensePlan)
        {
            expensePlans.append(_expensePlan)

            return true
        }
        return false
    }


    static func DeleteIncomePlan(_incomePlan:ExpensePlan) -> Bool
    {
        if DBManager.DeletePlan(_incomePlan)
        {
            expensePlans.removeAtIndex(expensePlans.indexOf(_incomePlan)!)

            return true
        }
        return false
    }

    static func UpdateIncomePlans()
    {
        expensePlans = DBManager.GetExpensePlans()
    }

    static func GetAllIncomePlansTotalAmount(_until:NSDate) -> Double
    {
        var totalSum = 0.0
        for item in expensePlans
        {
            totalSum = totalSum + item.GetPlanRemainingTotalAmount(_until)
        }
        return totalSum
    }

}


//---------------------------------------------------------------------------------//

class CategoryManager: NSObject {

    static private var catItems: [CategoryItem] = []

    static func AddCategory(_newCat:CategoryItem) -> Bool
    {
        if DBManager.AddCategoryItem(_newCat)
        {
            catItems.append(_newCat)

            return true
        }
        return false
    }


    static func DeleteCategory(_delCat:CategoryItem) -> Bool
    {
        if DBManager.DeleteCategory(_delCat)
        {
            catItems.removeAtIndex(catItems.indexOf(_delCat)!)

            return true
        }
        return false
    }

    static func UpdateCategories()
    {
        catItems = DBManager.GetCategoryItems()
    }

}






