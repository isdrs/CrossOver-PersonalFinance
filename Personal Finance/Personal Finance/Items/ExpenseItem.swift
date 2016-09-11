//
//  ExpenseItem.swift
//  Personal Finance
//
//  Created by Maysam Mohsenian on 6/21/1395 AP.
//  Copyright © 1395 Mohammad Lashgarbolouk. All rights reserved.
//

import UIKit



class ExpenseItem: IncomeItem {


    var category: CategoryItem? = CategoryItem()


    var ExpenseCategory: CategoryItem
        {
        get
        {
            return self.category!
        }
        set(newVal)
        {
            self.category = newVal
        }
    }

    

}
