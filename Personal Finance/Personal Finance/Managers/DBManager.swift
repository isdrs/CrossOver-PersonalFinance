//
//  DBManager.swift
//  Personal Finance
//
//  Created by Admin on ۱۳۹۵/۶/۲۱ ه‍.ش..
//  Copyright © ۱۳۹۵ ه‍.ش. Mohammad Lashgarbolouk. All rights reserved.
//

import UIKit
import CoreData

class DBManager: NSObject
{
    private static let UserNameKey: String = "User_Name"
    
    private static let AccountNumberKey: String = "Account_Number"
    
    private static let AccountBalanceKey: String = "Account_Balance"
    
    private static let PlansEntityName: String = "Plans"
    
    private static let CategoryEntityName: String = "Categories"

    static func GetPlans() -> [PlanItem]
    {
        var planItems = [PlanItem]()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: PlansEntityName)
        
        //3
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            
            if let myPlans = results as? [Plans]
            {
                for plan in myPlans {
                    
                    let planItem = PlanItem(_id: plan.id!, _name: plan.desc!, _amount: plan.amount!.doubleValue, _repeatitiontype: plan.type!.PlanTypeValue(), _repeatNumber: plan.repeatnumber!.integerValue, _firstDate: plan.firstdate!, _category: GetCategoryItemByID(plan.categoryid!.integerValue) )
                    
                    planItems.append(planItem)
                }
            }
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        return planItems
    }
    
    static func GetCategoryItem(myCat: Categories) -> CategoryItem
    {
        return CategoryItem(_id: myCat.id!.integerValue, _name: myCat.name!, _type: myCat.type!.TransactionTypeValue())
    }
    
    static func GetCategories(myCat: CategoryItem) -> Categories
    {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let category = NSEntityDescription.insertNewObjectForEntityForName(CategoryEntityName, inManagedObjectContext: managedContext) as! Categories
        
        category.id = myCat.ID
        category.name = myCat.Name
        category.type = myCat.Type.rawValue

        return category
    }
    
    static func GetCategoryItemByID(catID: Int) -> CategoryItem
    {
    
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: CategoryEntityName)
        
        fetchRequest.predicate = NSPredicate(format: "id == %@", String(catID))
        
        //3
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            
            if let myCats = results as? [Categories]
            {
                if myCats.count > 0
                {
                    for myCat in myCats
                    {
                        return CategoryItem(_id: myCat.id!.integerValue, _name: myCat.name!, _type: myCat.type!.TransactionTypeValue())
                    }
                    
                }
            }
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        return CategoryItem()
    }

    static func GetCategoryItems() -> [CategoryItem]
    {
        var categoryItems = [CategoryItem]()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: CategoryEntityName)
        
        //3
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            
            if let myCats = results as? [Categories]
            {
                if myCats.count > 0
                {
                    for myCat in myCats
                    {
                        let categoryItem = CategoryItem(_id: myCat.id!.integerValue, _name: myCat.name!, _type: myCat.type!.TransactionTypeValue())
                        
                        categoryItems.append(categoryItem)
                    }
                    
                }
            }
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        return categoryItems
    }


    static func AddPlan(_plan:PlanItem) -> Bool
    {
        var retVal = false
        
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let plansEntity =  NSEntityDescription.entityForName(PlansEntityName, inManagedObjectContext:managedContext)
        
        let plans = NSManagedObject(entity: plansEntity!, insertIntoManagedObjectContext: managedContext) as! Plans
        
        //3
        
        plans.id = _plan.ID
        plans.amount = _plan.Amount
        plans.categoryid = _plan.PlanCategory.ID
        plans.desc = _plan.Name
        plans.firstdate = _plan.FirstTimeDate
        plans.repeatnumber = _plan.RepeatNumber
        plans.type = _plan.RepeatitionType.rawValue
        
        //4
        do {
            try managedContext.save()
            retVal = true
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        return retVal
    }


    static func AddCategoryItem(_cat:CategoryItem) -> Bool{
        var retVal = false
        
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let categoryEntity =  NSEntityDescription.entityForName(CategoryEntityName, inManagedObjectContext:managedContext)
        
        let category = NSManagedObject(entity: categoryEntity!, insertIntoManagedObjectContext: managedContext) as! Categories
        
        //3
        category.id = _cat.ID
        category.name = _cat.Name
        category.type = _cat.Type.rawValue
        
        //4
        do {
            try managedContext.save()
            retVal = true
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        return retVal
    }
    

    static func DeletePlan(_plan:PlanItem) -> Bool
    {
        var retVal = false
        
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: PlansEntityName)
        
        fetchRequest.predicate = NSPredicate(format: "id == %@", _plan.ID)
        
        //3
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            
            if let myPlans = results as? [Plans]
            {
                if myPlans.count > 0
                {
                    for myPlan in myPlans
                    {
                        managedContext.deleteObject(myPlan)
                        
                        do {
                            try managedContext.save()
                            retVal = true
                        } catch let error as NSError  {
                            print("Could not save \(error), \(error.userInfo)")
                        }
                    }
                    
                }
            }
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        return retVal
    }

    static func DeleteCategory(_cat:CategoryItem) -> Bool
    {
        var retVal = false
        
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: CategoryEntityName)
        
        fetchRequest.predicate = NSPredicate(format: "id == %@", String(_cat.ID))
        
        //3
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            
            if let myCats = results as? [Categories]
            {
                if myCats.count > 0
                {
                    for myCat in myCats
                    {
                        managedContext.deleteObject(myCat)
                
                        //4
                        do {
                            try managedContext.save()
                            retVal = true
                        } catch let error as NSError  {
                            print("Could not save \(error), \(error.userInfo)")
                        }
                    }
                    
                }
            }
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }

        

        
        return retVal
    }
    
    
    
    ///Get account data
    static func GetBankAccountItem() -> AccountItem
    {
        let preferences = NSUserDefaults.standardUserDefaults()
        
        
        let account : AccountItem = AccountItem()
        
        if preferences.objectForKey(AccountNumberKey) == nil {
            return account
        }
        else
        {
            account.Name = preferences.objectForKey(UserNameKey) as! String
            
            account.AccountNumber = preferences.objectForKey(AccountNumberKey) as! String
            
            account.Balance = preferences.objectForKey(AccountBalanceKey) as! Double
            
            return account
        }
    }
    
    ///Set account data
    static func AddBankAccountItem(account : AccountItem) -> Bool
    {
        let preferences = NSUserDefaults.standardUserDefaults()
        
        preferences.setObject(account.Name, forKey: UserNameKey)
        
        preferences.setObject(account.AccountNumber, forKey: AccountNumberKey)

        preferences.setDouble(account.Balance, forKey: AccountBalanceKey)
        
        //  Save to disk
        return preferences.synchronize()
    }
    
    static func UpdateAccountBalance(account: AccountItem) -> Bool {
        let preferences = NSUserDefaults.standardUserDefaults()
        
        preferences.setDouble(account.Balance, forKey: AccountBalanceKey)
        
        //  Save to disk
        return preferences.synchronize()
    }
}
