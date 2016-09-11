//
//  NewIncomeViewController.swift
//  Personal Finance
//
//  Created by Admin on ۱۳۹۵/۶/۲۱ ه‍.ش..
//  Copyright © ۱۳۹۵ ه‍.ش. Mohammad Lashgarbolouk. All rights reserved.
//

import UIKit

class NewIncomeViewController: UIViewController {
    @IBOutlet weak var txtIncomeName: UITextField!
    @IBOutlet weak var swhRecurringOutlet: UISwitch!
    @IBOutlet weak var txtIncomeDay: UITextField!
    @IBOutlet weak var txtIncomeMonth: UITextField!
    @IBOutlet weak var txtIncomeAmount: UITextField!
    @IBAction func swhRecurringAction(sender: AnyObject) {
    }
    @IBAction func btnAddNewIncome(sender: AnyObject) {
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
