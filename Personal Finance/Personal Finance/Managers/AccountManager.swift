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
        return 0.0
    }

}
