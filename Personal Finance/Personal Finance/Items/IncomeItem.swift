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

    private var id: Int?

    private var name: String?

    private var amount: Float?

    private var type: PlanType?

    private var date: NSDate?

    private var repeatNumber: Int?

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
    
}
