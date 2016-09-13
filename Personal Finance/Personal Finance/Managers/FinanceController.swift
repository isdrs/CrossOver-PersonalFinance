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
        return true
    }


    static func AddBankAccount(_accountName:String,_accountNumber:String) -> AccountItem
    {
        let balance = UpdateBalance(_accountNumber)

        let updateAccount = AccountItem(_accountNumber: _accountNumber, _name: _accountName, _balance: balance)

        return updateAccount

    }

    static func UpdateBalance(_accountNumber:String) -> Double
    {

        return 0.0
    }

    static func GetIncomePlans() -> [PlanItem]
    {
        return [PlanItem]()
    }

    static func GetExpensePlans() -> [PlanItem]
    {
        return [PlanItem]()
    }

    static func DeletePlan() -> Bool
    {
        return true
    }




}
