//
//  Client.swift
//  Final Project
//
//  Created by Elizabeth Boswell on 11/5/18.
//  Copyright © 2018 Elizabeth Boswell. All rights reserved.
//

import Foundation

//struct Client {
//    var clientFirstName: String = ""
//    var clientLastName:  String = ""
//    var hasCaregiver: [String:Staff?] = [:]
//}

class Client {
    var clientFirstName: String = ""
    var clientLastName:  String = ""
    var hasCaregiver: [String:Staff?] = [:]
    
    
    init(clientFirstName:String, clientLastName:String, hasCaregiver: [String:Staff?]) {
        self.clientFirstName = clientFirstName
        self.clientLastName = clientLastName
        self.hasCaregiver = hasCaregiver
    }
}
