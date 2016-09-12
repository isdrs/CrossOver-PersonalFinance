//
//  NewCategoryViewController.swift
//  Personal Finance
//
//  Created by Admin on ۱۳۹۵/۶/۲۲ ه‍.ش..
//  Copyright © ۱۳۹۵ ه‍.ش. Mohammad Lashgarbolouk. All rights reserved.
//

import UIKit

class NewCategoryViewController: UIViewController {
    @IBOutlet weak var txtCatName: UITextField!
    @IBOutlet weak var swhIsIncome: UISwitch!
    @IBAction func btnAddAction(sender: AnyObject) {
        
        if txtCatName.text != ""
        {
            let newCat = CategoryItem(_name: txtCatName.text!, _type: swhIsIncome.on ? .Income : .Expense)
            
            if DBManager.AddCategoryItem(newCat) {
                self.navigationController?.popViewControllerAnimated(true)
            }
            else
            {
                SCLAlertView().showError("Error", subTitle: "Cannot Save Category")
            }
        }
        else
        {
            SCLAlertView().showNotice("Notice", subTitle: "Please enter your name")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
