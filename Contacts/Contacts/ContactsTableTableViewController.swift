//
//  ContactsTableTableViewController.swift
//  Contacts
//
//  Created by Adam Caldwell on 4/23/15.
//  Copyright (c) 2015 Adam Caldwell. All rights reserved.
//

import UIKit

class ContactsTableTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    
    var contactList : [Contact] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let moveButton = UIBarButtonItem(barButtonSystemItem: .Edit, target: self, action: Selector("toggleEdit"))
        self.navigationItem.leftBarButtonItem = moveButton
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: Selector("addContact"))
        navigationItem.rightBarButtonItem = addButton
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.title = "Contacts"
        let jenny = Contact(number: "867-5309")
        let rich = Contact(name: "Rich", number: "888-888-8888")
        let mindy = Contact(name: "Mindy")
        
        self.contactList.append(jenny)
        self.contactList.append(rich)
        self.contactList.append(mindy)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contactList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        let contact = self.contactList[indexPath.row]
        
        if let name = contact.name {
            cell.textLabel?.text = name
        } else {
            cell.textLabel?.text = "No Name"
        }
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SHOW_DETAIL" {
            let detailViewController = segue.destinationViewController as DetailViewController
            let selectedIndexPath = self.tableView.indexPathForSelectedRow()
            var contactToPass = self.contactList[selectedIndexPath!.row]
            detailViewController.selectedContact = contactToPass
        }
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
        
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            self.contactList.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    func toggleEdit() {
        self.tableView.setEditing(!self.tableView.editing, animated: true)
    }
    
    func addContact() {
        let newContact = Contact(name: "New Contact")
        self.contactList.append(newContact)
        let newIndexPath = NSIndexPath(forRow: self.contactList.count - 1, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Automatic)
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        let contactMoving = self.contactList.removeAtIndex(fromIndexPath.row)
        self.contactList.insert(contactMoving, atIndex: toIndexPath.row)
    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if tableView.editing {
            return .None
        } else {
            return .Delete
        }
    }
    
    override func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
}
