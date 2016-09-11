//
//  ExpenceItem.swift
//  Personal Finance
//
//  Created by Admin on ۱۳۹۵/۶/۲۱ ه‍.ش..
//  Copyright © ۱۳۹۵ ه‍.ش. Mohammad Lashgarbolouk. All rights reserved.
//

import UIKit

class ExpenceItem: BaseTransactionItem
{
    enum ExpenceCategoryEnum : String
    {
        case Utilities = "Utilities"
        case Food_Drink = "Foods & Drinks"
        case Rent = "Rent"
    }
    
    private var expenceCategory: ExpenceCategoryEnum?
    
    var ExpenceCategory: ExpenceCategoryEnum
        {
        get
        {
            return self.expenceCategory!
        }
        set(newVal)
        {
            self.expenceCategory = newVal
        }
    }
    
}
