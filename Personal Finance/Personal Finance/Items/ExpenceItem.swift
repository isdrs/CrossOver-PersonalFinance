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
    enum ExpenceCategoryEnum {
        case Utility
        case Food_Drink
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
