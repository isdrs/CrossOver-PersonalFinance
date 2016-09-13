//
//  NewCategoryViewController.swift
//  Personal Finance
//
//  Created by Admin on ۱۳۹۵/۶/۲۲ ه‍.ش..
//  Copyright © ۱۳۹۵ ه‍.ش. Mohammad Lashgarbolouk. All rights reserved.
//

import UIKit

class NewCategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var txtCatName: UITextField!
    @IBOutlet weak var swhIsIncome: UISwitch!
    @IBOutlet weak var tblCategories: UITableView!
    
    var categories : [CategoryItem]?
    
    
    @IBAction func btnAddAction(sender: AnyObject)
    {
        
        if txtCatName.text != ""
        {
            let newCat = CategoryItem(_name: txtCatName.text!, _type: swhIsIncome.on ? .Income : .Expense)
            
            if DBManager.AddCategoryItem(newCat)
            {
                LoadData()
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
        self.hideKeyboardWhenTappedAround()
        
        LoadData()
        
        // Do any additional setup after loading the view.
    }
    
    func LoadData()
    {
        categories = DBManager.GetCategoryItems()
        
        tblCategories.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CategoryCell") as! CategoryCell

        cell.layer.cornerRadius = 10 //set corner radius here
        cell.layer.borderColor = UIColor.lightGrayColor().CGColor  // set cell border color here
        cell.layer.borderWidth = 1
        
        cell.lblCatName.text = categories![indexPath.row].Name
        cell.lblCatType.text = categories![indexPath.row].Type.rawValue.TransactionTypeName()
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            if DBManager.DeleteCategory(categories![indexPath.row])
            {
                categories!.removeAtIndex(indexPath.row)
                
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            }
            else
            {
                SCLAlertView().showError("Error", subTitle: "Cannot delete Category")
            }
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Categories"
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
