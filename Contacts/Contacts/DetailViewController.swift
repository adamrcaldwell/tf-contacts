//
//  DetailViewController.swift
//  Contacts
//
//  Created by Adam Caldwell on 4/30/15.
//  Copyright (c) 2015 Adam Caldwell. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
//    var selectedContact = Contact(name: "", number: "")
    var selectedContact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.nameLabel.text = selectedContact.name
//        self.phoneLabel.text = selectedContact.number
        if let contact = self.selectedContact {
            if let name = contact.name {
                self.nameLabel.text = name
            }
            if let number = contact.number {
                self.phoneLabel.text = number
            }
        }
        // Do any additional setup after loading the view.
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
