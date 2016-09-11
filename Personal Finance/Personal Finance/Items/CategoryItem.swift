//
//  CategoryItem.swift
//  Personal Finance
//
//  Created by Maysam Mohsenian on 6/21/1395 AP.
//  Copyright © 1395 Mohammad Lashgarbolouk. All rights reserved.
//

import UIKit


enum TransActionType {
    case Income
    case Expense
}

class CategoryItem: NSObject {

    private var id: Int?

    private var name: String?

    private var type: TransActionType?

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
    var Type: TransActionType
        {
        get
        {
            return self.type!
        }
        set(newVal)
        {
            self.type = newVal
        }
        
    }
    
}