//
//  Client.swift
//  Final Project
//
//  Created by Elizabeth Boswell on 11/5/18.
//  Copyright © 2018 Elizabeth Boswell. All rights reserved.
//

import Foundation


class Client {
    // Client properties
    var clientFirstName: String = ""
    var clientLastName:  String = ""
    var clientStreet: String = ""
    var clientCity: String = ""
    var clientState: String = ""
    var clientZip: Int
    var hasCaregiver: [String:Staff?] = [:]
    
    
    init(clientFirstName:String, clientLastName:String, clientStreet:String, clientCity:String, clientState: String, clientZip:Int, hasCaregiver: [String:Staff?]) {
        self.clientFirstName = clientFirstName
        self.clientLastName = clientLastName
        self.clientStreet = clientStreet
        self.clientCity = clientCity
        self.clientState = clientState
        self.clientZip = clientZip
        self.hasCaregiver = hasCaregiver
    }
}
