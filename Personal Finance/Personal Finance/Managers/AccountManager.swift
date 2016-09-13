//
//  AccountManager.swift
//  Personal Finance
//
//  Created by Maysam Mohsenian on 6/21/1395 AP.
//  Copyright © 1395 Mohammad Lashgarbolouk. All rights reserved.
//


import UIKit


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

    static func GetTotalStimatedExpenen(_until:NSDate) -> [PlanItem: Double]
    {
        var exPensePlans : [PlanItem : Double] = [:]

        let totalExpense = GetTotalExpense(_until)

        for item in PlanManager.GetPlansByType(PlanType.Expense)
        {
            let totalAmount = item.GetPlanRemainingTotalAmount(_until)
            exPensePlans[item] = (totalAmount * 100.0 ) / totalExpense
        }
        return exPensePlans
    }

    static func GetTotalStimatedIncome(_until:NSDate) -> [PlanItem: Double]
    {
        var inComePlans : [PlanItem : Double] = [:]

        let totalIncome = GetTotalIncome(_until)

        for item in PlanManager.GetPlansByType(PlanType.Income)
        {
            let totalAmount = item.GetPlanRemainingTotalAmount(_until)
            inComePlans[item] = (totalAmount * 100.0 ) / totalIncome
        }
        return inComePlans
    }

}
