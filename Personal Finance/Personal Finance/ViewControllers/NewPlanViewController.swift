//
//  NewExpenceViewController.swift
//  Personal Finance
//
//  Created by Admin on ۱۳۹۵/۶/۲۱ ه‍.ش..
//  Copyright © ۱۳۹۵ ه‍.ش. Mohammad Lashgarbolouk. All rights reserved.
//

import UIKit

class NewPlanViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var txtExpenceName: UITextField!
    @IBOutlet weak var dpvExpenceCategory: UIPickerView!
    @IBOutlet weak var swhIsIncomeOutlet: UISwitch!
    @IBOutlet weak var swhRecurringOutlet: UISwitch!
    @IBOutlet weak var txtExpenceDay: UITextField!
    @IBOutlet weak var txtExpenceMonth: UITextField!
    @IBOutlet weak var txtExpenceAmount: UITextField!

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
            txtExpenceName.text = myPlan?.Name
            
            dpvExpenceCategory.selectRow((myCategries?.indexOf((myPlan?.PlanCategory)!))!, inComponent: 0, animated: false)
            
            swhIsIncomeOutlet.setOn((myPlan?.PlanCategory.Type.rawValue.TransactionTypeValue())! , animated: false)
            
            swhRecurringOutlet.setOn((myPlan?.RepeatitionType.rawValue.PlanTypeValue())!, animated: false)
            
        }
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        myCategries = DBManager.GetCategoryItems()
        
        dpvExpenceCategory.reloadComponent(0)
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
