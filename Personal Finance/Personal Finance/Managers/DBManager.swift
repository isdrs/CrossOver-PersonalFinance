//
//  DBManager.swift
//  Personal Finance
//
//  Created by Admin on ۱۳۹۵/۶/۲۱ ه‍.ش..
//  Copyright © ۱۳۹۵ ه‍.ش. Mohammad Lashgarbolouk. All rights reserved.
//

import UIKit

class DBManager: NSObject
{
    static func GetPlans() -> [PlanItem]
    {
        return [PlanItem]()
    }

    static func GetCategoryItems() -> [CategoryItem]
    {
        return [CategoryItem]()
    }

    static func AddPlan(_plan:PlanItem) -> Bool{
        return true
    }

    static func AddCategoryItem(_cat:CategoryItem) -> Bool{
        return true
    }

    static func DeletePlan(_plan:PlanItem) -> Bool
    {
        return true
    }

    static func DeleteCategory(_cat:CategoryItem) -> Bool
    {
        return true
    }

    static func AddBankAccountItem(_account:AccountItem) -> Bool
    {
        return true
    }

    static func DeleteBankAccountItem(_account:AccountItem) -> Bool
    {
        return true
    }

    static func GetBankAccountItem() -> AccountItem
    {
        return AccountItem()
    }
}
