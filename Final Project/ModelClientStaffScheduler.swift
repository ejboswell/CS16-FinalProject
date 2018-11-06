//
//  ModelClientStaffScheduler.swift
//  Final Project
//
//  Created by Elizabeth Boswell on 11/5/18.
//  Copyright © 2018 Elizabeth Boswell. All rights reserved.
//

import Foundation

class ModelClientStaffScheduler {
    
    static var sharedInstance = ModelClientStaffScheduler()
    
    var masterClientList = ClientList()
    var masterStaffList = StaffList()

    init() {
        masterClientList.addClient(clientFirstName: "Michelle", clientLastName: "Smith")
        masterClientList.addClient(clientFirstName: "Ellie", clientLastName: "Knuppe")
        masterStaffList.addStaff(staffFirstName: "Hailey", staffLastName: "Ross")
        masterStaffList.addStaff(staffFirstName: "Rose", staffLastName: "Panna")
        masterStaffList.addStaff(staffFirstName: "Alivia", staffLastName: "Cohen")
        masterStaffList.addStaff(staffFirstName: "Rubie", staffLastName: "Haste")
        masterStaffList.addStaff(staffFirstName: "Lilly", staffLastName: "Ryman")
        masterStaffList.addStaff(staffFirstName: "Jayne", staffLastName: "Larson")
        masterStaffList.addStaff(staffFirstName: "Krista", staffLastName: "Icban")
    }
    
}
