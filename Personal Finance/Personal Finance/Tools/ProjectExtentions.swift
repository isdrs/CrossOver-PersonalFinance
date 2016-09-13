//
//  ProjectExtentions.swift
//  Personal Finance
//
//  Created by Admin on ۱۳۹۵/۶/۲۲ ه‍.ش..
//  Copyright © ۱۳۹۵ ه‍.ش. Mohammad Lashgarbolouk. All rights reserved.
//

import UIKit

///An extension for hide keyboard on touch event
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension NSNumber {
    func PlanTypeValue() -> PlanRepetitionType {
        switch self.intValue {
        case 1:
            return .Ad_hoc
        case 2:
            return .Recurring
        default:
            return .Ad_hoc
        }
    }
    
    func TransactionTypeValue() -> PlanType {
        switch self.intValue {
        case 1:
            return .Income
        case 2:
            return .Expense
        default:
            return .Income
        }
    }
}

extension Bool {
    func PlanTypeValue() -> PlanType {
        switch self {
        case true:
            return .Income
        case false:
            return .Expense
        }
    }
}

extension Int {
    func PlanTypeValue() -> Bool {
        switch self {
        case 1:
            return false
        case 2:
            return true
        default:
            return true
        }
    }
    
    func TransactionTypeValue() -> Bool {
        switch self {
        case 1:
            return true
        case 2:
            return false
        default:
            return true
        }
    }
}

extension Int {
    func TransactionTypeName() -> String {
        switch self {
        case 1:
            return "Income"
        case 2:
            return "Expense"
        default:
            return ""
        }
    }
}
