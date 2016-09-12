//
//  AccountManager.swift
//  Personal Finance
//
//  Created by Maysam Mohsenian on 6/21/1395 AP.
//  Copyright © 1395 Mohammad Lashgarbolouk. All rights reserved.
//


import UIKit


class AccountManager: NSObject {


    static func UpdateBalance(_account:AccountItem) -> Bool
    {
        if DBManager.UpdateAccountBalance(_account)
        {
            return true
        }
        return false
    }
    

    static func EstimateAccountBalance(_unitl:NSDate) -> Double
    {
        let balance = 0.0

        let inComes = PlanManager.GetAllIncomePlansTotalAmount(_unitl)

        let exPenses = PlanManager.GetAllExpensePlansTotalAmount(_unitl)

        let estimateBalance = balance + inComes  - exPenses

        return estimateBalance
    }

    static func GetTotalStimatedExpenenByCategory(_until:NSDate) -> [PlanItem: Double]
    {
        var exPensePlans : [PlanItem : Double] = [:]
        for item in PlanManager.GetPlansByType(PlanType.Expense)
        {
            let totalAmount = item.GetPlanRemainingTotalAmount(_until)
            exPensePlans[item] = totalAmount
        }
        return exPensePlans
    }

    static func GetTotalStimatedIncomeByCategory(_until:NSDate) -> [PlanItem: Double]
    {
        var inComePlans : [PlanItem : Double] = [:]
        for item in PlanManager.GetPlansByType(PlanType.Income)
        {
            let totalAmount = item.GetPlanRemainingTotalAmount(_until)
            inComePlans[item] = totalAmount
        }
        return inComePlans
    }

}
