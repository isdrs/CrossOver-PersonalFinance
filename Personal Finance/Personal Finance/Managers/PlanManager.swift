//
//  IncomeManager.swift
//  Personal Finance
//
//  Created by Maysam Mohsenian on 6/21/1395 AP.
//  Copyright © 1395 Mohammad Lashgarbolouk. All rights reserved.
//

import UIKit


class PlanManager: NSObject {

    static private var totalPlans: [PlanItem] = []

    static func AddPlan(_incomePlan:PlanItem) -> Bool
    {
        if DBManager.AddPlan(_incomePlan)
        {
            totalPlans.append(_incomePlan)

            return true
        }
        return false
    }


    static func DeletePlan(_incomePlan:PlanItem) -> Bool
    {
        if DBManager.DeletePlan(_incomePlan)
        {
            totalPlans.removeAtIndex(totalPlans.indexOf(_incomePlan)!)

            return true
        }
        return false
    }

    static func UpdatePlans()
    {
        totalPlans = DBManager.GetPlans()
    }

    static func GetAllIncomePlansTotalAmount(_until:NSDate) -> Double
    {
        var totalSum = 0.0
        for item in totalPlans
        {
            if item.PlanCategory.Type == TransActionType.Income
            {
                totalSum = totalSum + item.GetPlanRemainingTotalAmount(_until)
            }
        }
        return totalSum
    }

    static func GetAllExpensePlansTotalAmount(_until:NSDate) -> Double
    {
        var totalSum = 0.0
        for item in totalPlans
        {
            if item.PlanCategory.Type == TransActionType.Expense
            {
                totalSum = totalSum + item.GetPlanRemainingTotalAmount(_until)
            }
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

