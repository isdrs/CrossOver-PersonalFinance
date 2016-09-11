//
//  AccountItem.swift
//  Personal Finance
//
//  Created by Maysam Mohsenian on 6/21/1395 AP.
//  Copyright © 1395 Mohammad Lashgarbolouk. All rights reserved.
//

import UIKit

class AccountItem: NSObject {

    private var accountNumber: String? = ""

    private var name: String? = ""

    private var balance: Float? = 0.0

    var Balance: Float
        {
        get
        {
            return self.balance!
        }
        set(newVal)
        {
            self.balance = newVal
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
    var AccountNumber: String
        {
        get
        {
            return self.accountNumber!
        }
        set(newVal)
        {
            self.accountNumber = newVal
        }

    }

    override init() {
        super.init()
    }


    init(_accountNumber:String, _name:String, _balance:Float) {

        super.init()
        self.balance = _balance
        self.name = _name
        self.accountNumber = _accountNumber
    }
    
}
