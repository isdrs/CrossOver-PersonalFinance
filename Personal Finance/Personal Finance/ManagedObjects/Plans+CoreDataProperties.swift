//
//  Plans+CoreDataProperties.swift
//  Personal Finance
//
//  Created by Admin on ۱۳۹۵/۶/۲۲ ه‍.ش..
//  Copyright © ۱۳۹۵ ه‍.ش. Mohammad Lashgarbolouk. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Plans {

    @NSManaged var id: String?
    @NSManaged var desc: String?
    @NSManaged var amount: NSNumber?
    @NSManaged var type: NSNumber?
    @NSManaged var firstdate: NSDate?
    @NSManaged var repeatnumber: NSNumber?
    @NSManaged var category: NSNumber?

}
