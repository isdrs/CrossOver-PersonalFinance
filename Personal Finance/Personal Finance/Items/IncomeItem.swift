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

class IncomeItem: NSObject {

    private var id: Int? = 0
    private var name: String? = ""

    private var amount: Float? = 0.0

    private var type: PlanType? = PlanType.Ad_hoc

    private var date: NSDate? = NSDate()

    private var repeatNumber: Int? = 1

    private var eventsDate: [NSDate] = []


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
            return self.name!
        }
        set(newVal)
        {
            self.name = newVal
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
            return self.date!
        }
        set(newVal)
        {
            self.date = newVal

            if self.repeatNumber == nil
            {
                self.repeatNumber = 1
                self.type = PlanType.Ad_hoc
            }

            CalcultePlansDate()

        }

    }


    private func CalcultePlansDate() -> Void{

        for  index in 1...self.repeatNumber! {

            let calDate = NSCalendar.currentCalendar().dateByAddingUnit(.Month, value: index, toDate: self.FirstTimeDate, options: [])

            eventsDate.append(calDate!)
        }
    }

    override init() {
        super.init()
    }

    init(_id:Int) {
        self.id = _id
    }
    
}
