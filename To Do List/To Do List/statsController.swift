//
//  statsController.swift
//  To Do List
//
//  Created by Audrey Phone on 10/5/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class statsController: UIViewController {
    @IBOutlet weak var numberDone: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var completedLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    @IBAction func backToTableViewController(segue:UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTasksDone()
    }
        
    func getTasksDone() {
        let task = TableViewController().getTasksDone()
        numberDone.text = task
        }
    
}
