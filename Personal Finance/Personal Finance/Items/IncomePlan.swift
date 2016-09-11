//
//  IncomeItem.swift
//  Personal Finance
//
//  Created by Admin on ۱۳۹۵/۶/۲۱ ه‍.ش..
//  Copyright © ۱۳۹۵ ه‍.ش. Mohammad Lashgarbolouk. All rights reserved.
//

import UIKit

enum PlanType {
    case Ad_hoc
    case Recurring
}

class IncomePlan: NSObject {

    internal var id: Int? = 0

    internal var desc: String? = ""

    internal var amount: Float? = 0.0

    internal var type: PlanType? = PlanType.Ad_hoc

    internal var firstDate: NSDate? = NSDate()

    internal var repeatNumber: Int? = 1

    internal var eventsDate: [NSDate] = []


    var ID: Int
    {
        get
        {
            return self.id!
        }
        set(newVal)
        {
            self.id = newVal
        }
        
    }
    var Name: String
        {
        get
        {
            return self.desc!
        }
        set(newVal)
        {
            self.desc = newVal
        }

    }
    var Amount: Float
        {
        get
        {
            return self.amount!
        }
        set(newVal)
        {
            self.amount = newVal
        }

    }
    var Type: PlanType
        {
        get
        {
            return self.type!
        }
        set(newVal)
        {
            self.type = newVal
            if newVal == PlanType.Ad_hoc
            {
                self.repeatNumber = 1
            }
        }

    }
    var RepeatNumber: Int
        {
        get
        {
            return self.repeatNumber!
        }
        set(newVal)
        {
            if newVal <= 1
            {
                self.Type = PlanType.Ad_hoc
                self.repeatNumber = 1
            }
            else
            {
                self.Type = PlanType.Recurring
                self.repeatNumber = newVal
            }
        }

    }
    var FirstTimeDate: NSDate
        {
        get
        {
            return self.firstDate!
        }
        set(newVal)
        {
            self.firstDate = newVal

            if self.repeatNumber == nil
            {
                self.repeatNumber = 1
                self.type = PlanType.Ad_hoc
            }

            CalcultePlansDate()

        }

    }


    internal func CalcultePlansDate() -> Void{

        for  index in 1...self.repeatNumber! {

            let calDate = NSCalendar.currentCalendar().dateByAddingUnit(.Month, value: index, toDate: self.FirstTimeDate, options: [])

            eventsDate.append(calDate!)
        }
    }

    override init() {
        super.init()
    }

    init(_id:Int,_name:String,_amount:Float,_type:PlanType,_repeatNumber:Int,_firstDate:NSDate) {
        super.init()
        self.id = _id
        self.desc = _name
        self.amount = _amount
        self.type = _type
        self.repeatNumber = _repeatNumber
        self.firstDate = _firstDate
        CalcultePlansDate()
    }
    
}
