//
//  AccountManager.swift
//  Personal Finance
//
//  Created by Maysam Mohsenian on 6/21/1395 AP.
//  Copyright © 1395 Mohammad Lashgarbolouk. All rights reserved.
//


import UIKit
import Foundation


class AccountManager: NSObject {


    static let staticBalance = 1000.0

    static func UpdateBalance(_account:AccountItem) -> Bool
    {
        if DBManager.UpdateAccountBalance(_account)
        {
            return true
        }
        return false
    }
    

    static func GetEstimateAccountBalance(_unitl:NSDate) -> Double
    {
        let balance = staticBalance

        let inComes = PlanManager.GetAllIncomePlansTotalAmount(_unitl)

        let exPenses = PlanManager.GetAllExpensePlansTotalAmount(_unitl)

        let estimateBalance = balance + inComes  - exPenses

        return estimateBalance
    }

    static func GetTotalExpense(_until:NSDate) -> Double
    {
        var totalAmount = 0.0

        for item in PlanManager.GetPlansByType(PlanType.Expense)
        {
            totalAmount = totalAmount + item.GetPlanRemainingTotalAmount(_until)
        }
        return totalAmount
    }

    static func GetTotalIncome(_until:NSDate) -> Double
    {
        var totalAmount = 0.0

        for item in PlanManager.GetPlansByType(PlanType.Income)
        {
            totalAmount = totalAmount + item.GetPlanRemainingTotalAmount(_until)
        }
        return totalAmount
    }

    static func GetTotalStimatedExpenenInCategory(_until:NSDate) -> [String: Double]
    {
        var exPensePlans : [String : Double]? = [:]

        let totalExpense = GetTotalExpense(_until)

        for item in PlanManager.GetPlansByType(PlanType.Expense)
        {
            let totalAmount = item.GetPlanRemainingTotalAmount(_until)

            if let catvalue = exPensePlans![item.PlanCategory.Name]
            {
                exPensePlans![item.PlanCategory.Name] = catvalue + totalAmount
            }
            else
            {
                exPensePlans![item.PlanCategory.Name] = totalAmount
            }

        }
        for cat in exPensePlans!.keys
        {

            var newValue = (exPensePlans![cat]! * 100.0 ) / totalExpense

               newValue = round(newValue)

                if newValue == 0
                {
                    exPensePlans?.removeValueForKey(cat)
                }
                else
                {
                    exPensePlans![cat] = newValue
                }
        }
        return exPensePlans!
    }
}







