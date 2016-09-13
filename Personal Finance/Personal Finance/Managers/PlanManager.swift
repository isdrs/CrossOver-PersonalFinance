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
            totalPlans = DBManager.GetPlans()

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
        
        for item in GetPlansByType(PlanType.Income)
        {

                totalSum = totalSum + item.GetPlanRemainingTotalAmount(_until)

        }
        return totalSum
    }

    static func GetAllExpensePlansTotalAmount(_until:NSDate) -> Double
    {
        var totalSum = 0.0
        for item in GetPlansByType(PlanType.Expense)
        {
                totalSum = totalSum + item.GetPlanRemainingTotalAmount(_until)
        }
        return totalSum
    }


    static func GetPlansByType(_type:PlanType) -> [PlanItem]
    {
        var plans : [PlanItem] = []

        for plan in totalPlans
        {
            if plan.PlanCategory.Type.rawValue == _type.rawValue
            {
                plans.append(plan)
            }
        }
        return plans
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
            catItems = DBManager.GetCategoryItems()

            return true
        }
        return false
    }

    static func UpdateCategories()
    {
        catItems = DBManager.GetCategoryItems()
    }

    static func GetCategoryById(_id:Int) -> CategoryItem
    {
        for cat in catItems
        {
            if cat.ID == _id
            {
                return cat
            }
        }
        return CategoryItem()
    }

    static func GetCategoryByType(_type:PlanType) -> [CategoryItem]
    {
        var cats = [CategoryItem]()

        for cat in catItems
        {
            if cat.Type.rawValue == _type.rawValue
            {
                cats.append(cat)
            }
        }

        return cats
    }
    
}

