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


class PlanItem: NSObject {

    internal var id: String? = ""

    internal var desc: String? = ""

    internal var amount: Double? = 0.0

    internal var type: PlanType? = PlanType.Ad_hoc

    internal var firstDate: NSDate? = NSDate()

    internal var repeatNumber: Int? = 1

    internal var eventsDate: [NSDate] = []

    internal var category: CategoryItem? = CategoryItem()


    var PlanCategory: CategoryItem
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

    var ID: String
    {
        get
        {
            return self.id!
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
    var Amount: Double
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


    ///Calculate total amount of this plan until specific Date
    func GetPlanRemainingTotalAmount(_until:NSDate) -> Double
    {
        var count = 0

        let now = NSDate()

        for plan in eventsDate
        {
            if plan.compare(now) == NSComparisonResult.OrderedDescending //means plan is after now
            {
                count = count + 1
            }
        }
        return Double(count) * self.amount!
    }
    

    internal func CalcultePlansDate() -> Void{

        for  index in 1...self.repeatNumber! {

            let calDate = NSCalendar.currentCalendar().dateByAddingUnit(.Month, value: index, toDate: self.FirstTimeDate, options: [])

            eventsDate.append(calDate!)
        }
    }

    func GenerateID()
    {
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Second,.Minute,.Hour, .Day , .Month , .Year], fromDate: date)

        let year =  components.year
        let month = components.month
        let day = components.day

        let hour =  components.hour
        let minute = components.minute
        let second = components.second


        let newId = String(year) + String(month) + String(day)

        let newId1 = String(hour) + String(minute) + String(second)



        self.id = newId + newId1
    }

    
    override init() {
        super.init()
        GenerateID()
    }

    init (_id:String)
    {
        super.init()
        self.id = _id
    }

    init(_id:String,_name:String,_amount:Double,_type:PlanType,_repeatNumber:Int,_firstDate:NSDate,_category:CategoryItem) {
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
