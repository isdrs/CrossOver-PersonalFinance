//
//  NewExpenceViewController.swift
//  Personal Finance
//
//  Created by Admin on ۱۳۹۵/۶/۲۱ ه‍.ش..
//  Copyright © ۱۳۹۵ ه‍.ش. Mohammad Lashgarbolouk. All rights reserved.
//

import UIKit

class NewPlanViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var txtPlanName: UITextField!
    @IBOutlet weak var dpvPlanCategory: UIPickerView!
    @IBOutlet weak var dpvDate: UIDatePicker!
    @IBOutlet weak var swhIsIncomeOutlet: UISwitch!
    @IBOutlet weak var swhRecurringOutlet: UISwitch!
    @IBOutlet weak var txtPlanAmount: UITextField!
    @IBAction func swhRecurringAction(sender: UISwitch) {
    }

    @IBAction func btnAddNewExpence(sender: AnyObject) {
    }
    @IBAction func NewCtegoryAction(sender: AnyObject)
    {
        
        
    }
    
    var myPlan : PlanItem?
    
    var myCategries : [CategoryItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if myPlan != nil
        {
            txtPlanName.text = myPlan?.Name
            
            dpvPlanCategory.selectRow((myCategries!.indexOf((myPlan!.PlanCategory)))!, inComponent: 0, animated: false)
            
            swhIsIncomeOutlet.setOn((myPlan!.PlanCategory.Type.rawValue.TransactionTypeValue()) , animated: false)
            
            swhRecurringOutlet.setOn((myPlan!.Type.rawValue.PlanTypeValue()), animated: false)
            
            dpvDate.date = myPlan!.FirstTimeDate
            
            txtPlanAmount.text = String(myPlan!.Amount)
            
        }
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        myCategries = DBManager.GetCategoryItems()
        
        dpvPlanCategory.reloadComponent(0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myCategries!.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myCategries![row].Name
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
