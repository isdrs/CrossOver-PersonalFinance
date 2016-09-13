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
    @IBOutlet weak var txtRepeatNo: UITextField!
    @IBOutlet weak var btnAddOrUpdateOutlet: UIButton!



    var planCategories : [CategoryItem]?


    @IBAction func swhIsIncome(sender: AnyObject)
    {
        planCategories = FinanceController.GetCategoriesByType(swhIsIncomeOutlet.on)
        
        dpvPlanCategory.reloadComponent(0)
    }
    @IBAction func swhRecurringAction(sender: UISwitch)
    {
        if swhRecurringOutlet.on
        {
            txtRepeatNo.hidden = false
            txtRepeatNo.text = ""
        }
        else
        {
            txtRepeatNo.hidden = true
        }
    }

    @IBAction func btnAddOrUpdateNewPlan(sender: AnyObject) {

        let planName = txtPlanName.text

        let amount = Double(txtPlanAmount.text!)

        let selectedCat = planCategories?.count > 0 ? planCategories![dpvPlanCategory.selectedRowInComponent(0)] as CategoryItem : CategoryItem()

        let isRecurring = swhRecurringOutlet.on ? PlanRepetitionType.Recurring  : PlanRepetitionType.Ad_hoc

        let repeatNo = isRecurring == PlanRepetitionType.Recurring ? (Int(txtRepeatNo.text!)) : 1

        let startTime = dpvDate.date

        if planName == "" || amount == nil  || repeatNo == nil || selectedCat.ID == -1
        {
            SCLAlertView().showError("Warning", subTitle: "Please fill all info")

        }
        else
        {
            if FinanceController.AddPlan(planName!, _amount: amount!, _repeatitiontype: isRecurring, _repeatNumber: repeatNo!, _firstDate: startTime, _cat : selectedCat)
            {
                SCLAlertView().showInfo("Done", subTitle: "Plan has been added")
                txtPlanName.text = ""
                txtRepeatNo.text = ""
                txtPlanAmount.text = ""
            }
            else
            {
                SCLAlertView().showError("Error", subTitle: "Something goes wrong")
            }
        }


    }


    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()

//        if myPlan != nil
//        {
//            txtPlanName.text = myPlan?.Name
//            
//
//            
//            swhIsIncomeOutlet.setOn((myPlan!.PlanCategory.Type.rawValue.TransactionTypeValue()) , animated: false)
//            
//            swhRecurringOutlet.setOn((myPlan!.RepeatitionType.rawValue.PlanTypeValue()), animated: false)
//            
//            if swhRecurringOutlet.on {
//                txtRepeatNo.hidden = false
//                txtRepeatNo.text = String(myPlan!.RepeatNumber)
//            }
//            else
//            {
//                txtRepeatNo.hidden = true
//            }
//            
//            dpvDate.date = myPlan!.FirstTimeDate
//            
//            txtPlanAmount.text = String(myPlan!.Amount)
//            
//        }

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {

        planCategories = FinanceController.GetCategoriesByType(swhIsIncomeOutlet.on)
        
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
        return planCategories!.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return planCategories![row].Name
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
