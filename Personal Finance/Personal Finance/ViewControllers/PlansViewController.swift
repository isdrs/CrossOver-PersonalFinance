//
//  PlansViewController.swift
//  Personal Finance
//
//  Created by Admin on ۱۳۹۵/۶/۲۲ ه‍.ش..
//  Copyright © ۱۳۹۵ ه‍.ش. Mohammad Lashgarbolouk. All rights reserved.
//

import UIKit

class PlansViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITabBarDelegate {
    @IBOutlet weak var tblPlans: UITableView!
    @IBOutlet weak var tbrPlans: UITabBar!
    
    var isIncome = true
    
    let incomeItemTag = 1002

    let expenseItemTag = 1003
    

    var myPlans : [PlanItem]?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()


        
        myPlans = FilterPlans()
        // Do any additional setup after loading the view.
    }
    
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        
        switch item.tag
        {
        case incomeItemTag:
            isIncome = true
        case expenseItemTag:
            isIncome = false
        default:
            break
        }
        
        myPlans = FilterPlans()
        
        tblPlans.reloadData()
    }
    
    func FilterPlans() -> [PlanItem] {
        if isIncome
        {
            return  FinanceController.GetIncomePlans()
        }
        return FinanceController.GetExpensePlans()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPlans!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PlansCell") as! PlansCell
        
        cell.layer.cornerRadius = 10 //set corner radius here
        cell.layer.borderColor = UIColor.lightGrayColor().CGColor  // set cell border color here
        cell.layer.borderWidth = 1
        
        cell.lblName.text = myPlans![indexPath.row].Name
        
        cell.lblType.text = myPlans![indexPath.row].PlanCategory.Type.rawValue.TransactionTypeName()
        
        cell.lblDate.text = ""
        
        cell.lblAmount.text = String(myPlans![indexPath.row].Amount) + " $"
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {

            if FinanceController.DeletePlan(myPlans![indexPath.row].ID)
            {
                myPlans = FilterPlans()
                
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            }
            else
            {
                SCLAlertView().showError("Error", subTitle: "Cannot delete Category")
            }
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if isIncome {
            return "Incomes"
        }
        
        return "Expences"
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
