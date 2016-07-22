//
//  recipientTableViewController.swift
//  SlapChat
//
//  Created by Colin Walsh on 7/21/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class recipientTableViewController: UITableViewController {
    
    let store: DataStore = DataStore()
    var managedRecepientObjects = Recipient()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        store.fetchData()
        
        tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.store.recipients.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("basicCell", forIndexPath: indexPath)
        
        // Configure the cell...
        
        let getRecipient = self.store.recipients[indexPath.row]
        
        cell.textLabel?.text = getRecipient.name
        
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPath = tableView.indexPathForSelectedRow
        
        let selectedRecipient = store.recipients[indexPath!.row]
        
        let destinationVC = segue.destinationViewController as! TableViewController
        
        if let messageSet = selectedRecipient.messages{
            destinationVC.messages = messageSet}
    }
    
    
    
}
