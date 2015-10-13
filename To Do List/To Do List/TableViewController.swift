//
//  TableViewController.swift
//  To Do List
//
//  Created by Audrey Phone on 10/5/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet weak var NewButton: UIBarButtonItem!
    @IBOutlet weak var StatsButton: UIBarButtonItem!
    @IBAction func backToTableViewController(segue:UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(0, forKey: "tasksDone")
    }
    
    func getTasksDone() -> String {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let count = defaults.stringForKey("tasksDone")
        {
            return count
        }
        return "error"
    }
    
    @IBAction func saveTask(segue:UIStoryboardSegue) {
        if let NewController = segue.sourceViewController as? NewController {

            if let task = NewController.taskName {
                tasks.append(task)
                let indexPath = NSIndexPath(forRow: tasks.count - 1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        }
    }
    
    @IBAction func cancelToTableViewController(segue:UIStoryboardSegue) {
    }
    
    var tasks = [ToDo]()
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("TaskCell", forIndexPath: indexPath)
            let task = tasks[indexPath.row] as ToDo
            var completedSwitch: UISwitch
            completedSwitch = UISwitch(frame: CGRectZero) as UISwitch
            completedSwitch.addTarget(self, action:Selector("switchChanged:"), forControlEvents: UIControlEvents.ValueChanged)
            completedSwitch.tag = indexPath.row
            cell.textLabel?.text = task.task
            cell.accessoryView = completedSwitch
            return cell
    }
    
    @IBAction func switchChanged(sender: UISwitch) {
        let delay = 86400.0
        var count = 0
        let defaults = NSUserDefaults.standardUserDefaults()
        if let num = defaults.stringForKey("tasksDone") {
            count = Int(num)!
        }
        if sender.on {
            count = count + 1
        }
        if !sender.on {
            count = count - 1
        }
        defaults.setObject(count, forKey: "tasksDone")
        _ = NSTimer.scheduledTimerWithTimeInterval(delay, target: self, selector: "removeCell:", userInfo: sender.tag, repeats: false)
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            tasks.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    func removeCell(timer:NSTimer) {
        let rowNumber = timer.userInfo as? NSNumber
        tasks.removeAtIndex(Int(rowNumber!))
        tableView.reloadData()
        var count = 0
        let defaults = NSUserDefaults.standardUserDefaults()
        if let num = defaults.stringForKey("tasksDone")
        {
            count = Int(num)!
            count = count - 1
        }
        defaults.setObject(count, forKey: "tasksDone")
        
    }
    
    
}
