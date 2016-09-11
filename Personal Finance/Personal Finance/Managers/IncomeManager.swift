//
//  IncomeManager.swift
//  Personal Finance
//
//  Created by Maysam Mohsenian on 6/21/1395 AP.
//  Copyright © 1395 Mohammad Lashgarbolouk. All rights reserved.
//

import UIKit


class IncomeManager: NSObject {

    static private var incomePlans: [IncomePlan] = []

    static func AddIncomePlan(_incomePlan:IncomePlan) -> Bool
    {
        if DBManager.AddIncomePlan(_incomePlan)
        {
            incomePlans.append(_incomePlan)

            return true
        }
        return false
    }


    static func DeleteIncomePlan(_incomePlan:IncomePlan) -> Bool
    {
        if DBManager.DeletePlan(_incomePlan)
        {
            incomePlans.removeAtIndex(incomePlans.indexOf(_incomePlan)!)

            return true
        }
        return false
    }

    static func UpdateIncomePlans()
    {
        incomePlans = DBManager.GetIncomePlans()
    }

    static func GetAllIncomePlansTotalAmount(_until:NSDate) -> Double
    {
        var totalSum = 0.0
        for item in incomePlans
        {
            totalSum = totalSum + item.GetPlanRemainingTotalAmount(_until)
        }
        return totalSum
    }
    

}
