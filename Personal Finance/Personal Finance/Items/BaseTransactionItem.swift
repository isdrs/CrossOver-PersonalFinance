//
//  BaseTransactionItem.swift
//  Personal Finance
//
//  Created by Admin on ۱۳۹۵/۶/۲۱ ه‍.ش..
//  Copyright © ۱۳۹۵ ه‍.ش. Mohammad Lashgarbolouk. All rights reserved.
//

import UIKit

class BaseTransactionItem: NSObject
{
    enum TransactionTypeEnum
    {
        case AD_HOC
        case Recurring
    }
    
    
    private var transactionID : Int?
    private var transactionName: String?
    private var transactionAmount: Double?
    private var transactionType: TransactionTypeEnum?
    private var transactionDate: NSDate?
    
    var TransactionID: Int
    {
        get
        {
            return self.transactionID!
        }
        set(newVal)
        {
            self.transactionID = newVal
        }
        
    }
    
    var TransactionName: String
        {
        get
        {
            return self.transactionName!
        }
        set(newVal)
        {
            self.transactionName = newVal
        }
        
    }
    
    var TransactionAmount: Double
        {
        get
        {
            return self.transactionAmount!
        }
        set(newVal)
        {
            self.transactionAmount = newVal
        }
        
    }
    
    var TransactionType: TransactionTypeEnum
        {
        get
        {
            return self.transactionType!
        }
        set(newVal)
        {
            self.transactionType = newVal
        }
        
    }
    
    var TransactionDate: NSDate
        {
        get
        {
            return self.transactionDate!
        }
        set(newVal)
        {
            self.transactionDate = newVal
        }
        
    }
}
