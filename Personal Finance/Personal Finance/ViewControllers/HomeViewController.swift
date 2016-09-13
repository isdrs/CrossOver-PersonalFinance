//
//  HomeViewController.swift
//  Personal Finance
//
//  Created by Admin on ۱۳۹۵/۶/۲۱ ه‍.ش..
//  Copyright © ۱۳۹۵ ه‍.ش. Mohammad Lashgarbolouk. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblHomeAccountBalance: UILabel!
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "loadIncomes"
        {
            let plansVC = segue.destinationViewController as! PlansViewController
            plansVC.isIncome = true
        }
        else if segue.identifier == "loadExpenses"
        {
            let plansVC = segue.destinationViewController as! PlansViewController
            plansVC.isIncome = false
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        self.navigationItem.setHidesBackButton(true, animated: false)

        FinanceController.UpdateAllList()
        
        let myAccount = FinanceController.GetAccount()
        
        lblUserName.text = myAccount.Name
        
        lblHomeAccountBalance.text = String(myAccount.Balance)
        
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
