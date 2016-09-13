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
    
    var allPlans : [PlanItem]?
    var myPlans : [PlanItem]?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        allPlans = DBManager.GetPlans()
        
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
        var filteredPlans = [PlanItem]()
        
        for plan in allPlans! {
            
            if plan.PlanCategory.Type.rawValue.TransactionTypeValue() == isIncome {
                filteredPlans.append(plan)
            }
        }
        
        return filteredPlans
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
        
        
        cell.lblName.text = myPlans![indexPath.row].Name
        
        cell.lblType.text = myPlans![indexPath.row].PlanCategory.Type.rawValue.TransactionTypeName()
        
        cell.lblDate.text = ""
        
        cell.lblAmount.text = String(myPlans![indexPath.row].Amount) + " $"
        
        return cell
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
