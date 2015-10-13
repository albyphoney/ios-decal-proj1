//
//  NewController.swift
//  To Do List
//
//  Created by Audrey Phone on 10/5/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class NewController: UIViewController {
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var enterField: UITextField!
    var taskName : ToDo?
    
    @IBAction func saveToTableViewController(segue:UIStoryboardSegue) {
    }
    
    @IBAction func cancelToTableViewController(segue:UIStoryboardSegue) {
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "saveSegue" {
            taskName = ToDo(text: enterField.text!)
        }
    }
}
