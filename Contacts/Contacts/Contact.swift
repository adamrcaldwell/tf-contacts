//
//  Contact.swift
//  Contacts
//
//  Created by Adam Caldwell on 4/30/15.
//  Copyright (c) 2015 Adam Caldwell. All rights reserved.
//

import UIKit

class Contact: NSObject {
    
    var name: String?
    var number: String?
    
    init(name: String? = nil, number: String? = nil) {
        self.name = name
        self.number = number
        super.init()
    }
   
}
