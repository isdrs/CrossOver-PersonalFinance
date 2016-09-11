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
//    private static let UserNameKey: String = "User_Name"
//    
//    private static let AccountNumberKey: String = "Account_Number"
//    
//    private static let AccountBalanceKey: String = "Account_Balance"
//    
//    private static let TotalIncomeAmountKey: String = "Total_Income_Amount"
//    
//    private static let TotalExpenceAmountKey: String = "Total_Expence_Amount"


    static func GetIncomePlans() -> [IncomePlan]
    {
        return [IncomePlan]()
    }

    static func GetExpensePlans() -> [ExpensePlan]
    {
            return [ExpensePlan]()
    }

    static func GetCategoryItems() -> [CategoryItem]
    {
        return [CategoryItem]()
    }

    static func AddIncomePlan(_plan:IncomePlan)-> Bool
    {
        return true
    }

    static func AddExpensePlan(_plan:ExpensePlan) -> Bool{
        return true
    }


    static func AddCategoryItem(_cat:CategoryItem) -> Bool{
        return true
    }


    static func DeletePlan(_plan:IncomePlan) -> Bool
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

    
    
//    ///Get user data like token, userid, and ... from user default preference
//    static func GetUserData() -> UserItem
//    {
//        let preferences = NSUserDefaults.standardUserDefaults()
//        
//        
//        let user : UserItem = UserItem()
//        
//        if preferences.objectForKey(userTokenKey) == nil {
//            return user
//        }
//        else
//        {
//            user.Token = preferences.objectForKey(userTokenKey) as? String
//            
//            user.UserID = preferences.objectForKey(userIDKey) as! Int
//            
//            user.UserSocialID = preferences.objectForKey(userSocialIDKey) as! Int
//            
//            user.UserName = preferences.objectForKey(userNameKey) as! String
//            
//            user.UserAvatarURL = preferences.objectForKey(userAvatarKey) as! String
//            
//            return user
//        }
//    }
//    
//    ///Set user data like token , userid, and ... to user default preference
//    static func SetUserData(user : UserItem) -> Bool
//    {
//        let preferences = NSUserDefaults.standardUserDefaults()
//        
//        
//        preferences.setObject(user.Token, forKey: userTokenKey)
//        
//        preferences.setInteger(user.UserID, forKey: userIDKey)
//        
//        preferences.setInteger(user.UserSocialID, forKey: userSocialIDKey)
//        
//        preferences.setObject(user.UserName, forKey: userNameKey)
//        
//        preferences.setObject(user.UserAvatarURL, forKey: userAvatarKey)
//        
//        //  Save to disk
//        return preferences.synchronize()
//    }
}
