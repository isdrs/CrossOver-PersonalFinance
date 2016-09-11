//
//  ExpenseItem.swift
//  Personal Finance
//
//  Created by Maysam Mohsenian on 6/21/1395 AP.
//  Copyright © 1395 Mohammad Lashgarbolouk. All rights reserved.
//

import UIKit



class ExpensePlan: IncomePlan {


    internal var category: CategoryItem? = CategoryItem()


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

    override init() {
        super.init()
    }

    init(_id:Int,_name:String,_amount:Float,_type:PlanType,_repeatNumber:Int,_firstDate:NSDate,_category:CategoryItem) {
        super.init()

        self.id = _id
        self.desc = _name
        self.amount = _amount
        self.type = _type
        self.repeatNumber = _repeatNumber
        self.firstDate = _firstDate
        self.category = _category

        CalcultePlansDate()
    }
    
    
}
