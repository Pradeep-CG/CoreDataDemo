//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Pradeep on 25/11/19.
//  Copyright © 2019 Pradeep. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        newUser.setValue("Pradeep", forKey: "username")
        newUser.setValue("abcd", forKey: "password")
        newUser.setValue("32", forKey: "age")
        
        
        // save the data
        do {
            try context.save()
        } catch {
            print("Failed Saving")
        }
        
        // retrieve the data
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
               print(data.value(forKey: "username") as! String)
          }
            
        } catch {
            
            print("Failed")
        }
    }


}

