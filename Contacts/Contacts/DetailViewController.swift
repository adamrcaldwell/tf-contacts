//
//  DetailViewController.swift
//  Contacts
//
//  Created by Adam Caldwell on 4/30/15.
//  Copyright (c) 2015 Adam Caldwell. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var nameField: UITextField!
    @IBOutlet var phoneNumberField: UITextField!
    var selectedContact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameField.delegate = self
        self.phoneNumberField.delegate = self
        if let contact = self.selectedContact {
            if let name = selectedContact?.name {
                self.nameField.text = name
            }
            if let number = selectedContact?.number {
                self.phoneNumberField.text = number
            }
        }
        // Do any additional setup after loading the view.
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if textField == self.nameField {
            self.selectedContact?.name = textField.text
        } else if textField == self.phoneNumberField {
            self.selectedContact?.number = textField.text
        }
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
