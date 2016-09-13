//
//  IncomeItem.swift
//  Personal Finance
//
//  Created by Admin on ۱۳۹۵/۶/۲۱ ه‍.ش..
//  Copyright © ۱۳۹۵ ه‍.ش. Mohammad Lashgarbolouk. All rights reserved.
//

import UIKit

enum PlanRepetitionType : Int {
    case Ad_hoc = 1
    case Recurring = 2
}





class PlanItem: NSObject {

    private var id: String = ""

    private var name: String = ""

    private var amount: Double = 0.0

    private var repeatitiontype: PlanRepetitionType = PlanRepetitionType.Ad_hoc

    private var firstDate: NSDate = NSDate()

    private var repeatNumber: Int = -1

    private var eventsDate: [NSDate] = []

    private var category: CategoryItem? = CategoryItem()


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
            return self.id
        }
        
    }
    var Name: String
        {
        get
        {
            return self.name
        }
        set(newVal)
        {
            self.name = newVal
        }

    }
    var Amount: Double
        {
        get
        {
            return self.amount
        }
        set(newVal)
        {
            self.amount = newVal
        }

    }
    var RepeatitionType: PlanRepetitionType
        {
        get
        {
            return self.repeatitiontype
        }
        set(newVal)
        {
            self.repeatitiontype = newVal
            if newVal == PlanRepetitionType.Ad_hoc
            {
                self.repeatNumber = 1
            }
        }

    }
    var RepeatNumber: Int
        {
        get
        {
            return self.repeatNumber
        }
        set(newVal)
        {
            if newVal <= 1
            {
                self.RepeatitionType = PlanRepetitionType.Ad_hoc
                self.repeatNumber = 1
            }
            else
            {
                self.RepeatitionType = PlanRepetitionType.Recurring
                self.repeatNumber = newVal
            }
        }

    }
    var FirstTimeDate: NSDate
        {
        get
        {
            return self.firstDate
        }
        set(newVal)
        {
            self.firstDate = newVal

            if self.repeatNumber == -1
            {
                self.repeatNumber = 1
                self.repeatitiontype = PlanRepetitionType.Ad_hoc
            }

            CalcultePlanOccursDate()

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
        return Double(count) * self.amount
    }
    

    internal func CalcultePlanOccursDate() -> Void{

        eventsDate.append(self.FirstTimeDate)

        if self.repeatNumber > 1
        {
        for  index in 1...self.repeatNumber - 1 {

            let calDate = NSCalendar.currentCalendar().dateByAddingUnit(.Month, value: index, toDate: self.FirstTimeDate, options: [])

            eventsDate.append(calDate!)
        }
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

    init(_id:String,_name:String,_amount:Double,_repeatitiontype:PlanRepetitionType,_repeatNumber:Int,_firstDate:NSDate,_category:CategoryItem) {

        super.init()

        self.id = _id
        self.name = _name
        self.amount = _amount
        self.repeatitiontype = _repeatitiontype
        self.repeatNumber = _repeatNumber
        self.firstDate = _firstDate
        self.category = _category

        CalcultePlanOccursDate()
    }
    
}
