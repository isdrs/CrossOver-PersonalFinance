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
    private static let UserNameKey: String = "User_Name"
    
    private static let AccountNumberKey: String = "Account_Number"
    
    private static let AccountBalanceKey: String = "Account_Balance"

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
    
    
    
    ///Get account data
    static func GetBankAccountItem() -> AccountItem
    {
        let preferences = NSUserDefaults.standardUserDefaults()
        
        
        let account : AccountItem = AccountItem()
        
        if preferences.objectForKey(AccountNumberKey) == nil {
            return account
        }
        else
        {
            account.Name = preferences.objectForKey(UserNameKey) as! String
            
            account.AccountNumber = preferences.objectForKey(AccountNumberKey) as! String
            
            account.Balance = preferences.objectForKey(AccountBalanceKey) as! Double
            
            return account
        }
    }
    
    ///Set account data
    static func AddBankAccountItem(account : AccountItem) -> Bool
    {
        let preferences = NSUserDefaults.standardUserDefaults()
        
        preferences.setObject(account.Name, forKey: UserNameKey)
        
        preferences.setObject(account.AccountNumber, forKey: AccountNumberKey)

        preferences.setDouble(account.Balance, forKey: AccountBalanceKey)
        
        //  Save to disk
        return preferences.synchronize()
    }
    
    static func UpdateAccountBalance(account: AccountItem) -> Bool {
        let preferences = NSUserDefaults.standardUserDefaults()
        
        preferences.setDouble(account.Balance, forKey: AccountBalanceKey)
        
        //  Save to disk
        return preferences.synchronize()
    }
}
