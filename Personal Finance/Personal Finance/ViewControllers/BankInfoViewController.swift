//
//  BankInfoViewController.swift
//  Personal Finance
//
//  Created by Admin on ۱۳۹۵/۶/۲۱ ه‍.ش..
//  Copyright © ۱۳۹۵ ه‍.ش. Mohammad Lashgarbolouk. All rights reserved.
//

import UIKit

class BankInfoViewController: UIViewController {
    @IBOutlet weak var lblBankName: UITextField!
    @IBOutlet weak var lblAccountNumber: UITextField!
    @IBAction func btnSaveAndContinueAction(sender: AnyObject)
    {
        if lblBankName.text != "" && lblAccountNumber.text != ""
        {
            let bank = lblBankName.text
            
            let account = lblAccountNumber.text
            
            
            if FinanceController.AddBankAccount(bank!, _accountNumber: account!)
            {
                self.performSegueWithIdentifier("loadHome", sender: sender)
            }
            else
            {
                SCLAlertView().showError("Error", subTitle: "Cannot save bank account")
            }
        }
        else
        {
            SCLAlertView().showNotice("Notice", subTitle: "Please fill all fields correctly")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
      

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
