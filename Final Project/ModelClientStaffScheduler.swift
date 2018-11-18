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
        masterClientList.addClient(clientFirstName: "Michelle", clientLastName: "Smith", hasCaregiver:["SunA" : nil, "SunB" : nil,"SunC" : nil, "MonA" : nil, "MonB" : nil, "MonC" : nil, "TuesA" : nil, "TuesB" : nil, "TuesC" : nil, "WedA" : nil,  "WedB" : nil, "WedC" : nil, "ThursA" : nil, "ThursB" : nil, "ThursC" : nil, "FriA" : nil, "FriB" : nil, "FriC" : nil, "SatA" : nil, "SatB" : nil, "SatC" : nil])
            masterClientList.addClient(clientFirstName: "Ellie", clientLastName: "Black", hasCaregiver: ["SunA" : nil, "SunB" : nil, "SunC" : nil ,"MonA" : nil, "MonB" : nil, "MonC" : nil, "TuesA" : nil, "TuesB" : nil, "TuesC" : nil, "WedA" : nil,  "WedB" : nil, "WedC" : nil, "ThursA" : nil, "ThursB" : nil, "ThursC" : nil, "FriA" : nil, "FriB" : nil, "FriC" : nil, "SatA" : nil, "SatB" : nil, "SatC" : nil])
//        masterStaffList.addStaff(staffFirstName: "Hailey", staffLastName: "Ross")
//        masterStaffList.addStaff(staffFirstName: "Rose", staffLastName: "Panna")
//        masterStaffList.addStaff(staffFirstName: "Alivia", staffLastName: "Cohen")
//        masterStaffList.addStaff(staffFirstName: "Rubie", staffLastName: "Haste")
//        masterStaffList.addStaff(staffFirstName: "Lilly", staffLastName: "Ryman")
//        masterStaffList.addStaff(staffFirstName: "Jayne", staffLastName: "Larson")
//        masterStaffList.addStaff(staffFirstName: "Krista", staffLastName: "Icban")
//        masterStaffList.addStaff(staffFirstName: "Hailey", staffLastName: "Ross", staffShiftsAvailable: ["MonC": "available", "TuesC" : "available", "WedB": "available", "ThursB" : "available", "FriC" : "available"], staffShiftsBooked: [:])
//        masterStaffList.addStaff(staffFirstName: "Alivia", staffLastName: "Cohen", staffShiftsAvailable: ["WedA" : "available", "ThursA" : "available", "FriA" : "available", "FriB" : "available", "SatA" : "available"], staffShiftsBooked: [:])
//        masterStaffList.addStaff(staffFirstName: "Rubie", staffLastName: "Haste", staffShiftsAvailable: ["SunA" : "available", "SunB" : "available", "MonA" : "available", "MonB" : "available", "TuesA" : "available", "TuesB" : "available"], staffShiftsBooked: [:])
//        masterStaffList.addStaff(staffFirstName: "Lilly", staffLastName: "Ryman", staffShiftsAvailable: ["WedC" : "available", "Thurs" : "available", "SatC" : "available"], staffShiftsBooked: [:])
//        masterStaffList.addStaff(staffFirstName: "Rose", staffLastName: "Panna", staffShiftsAvailable: ["MonC": "available", "TuesC" : "available", "WedB": "available", "ThursB" : "available", "FriC" : "available"], staffShiftsBooked: [:])
//        masterStaffList.addStaff(staffFirstName: "Jayne", staffLastName: "Larson", staffShiftsAvailable: ["WedA" : "available", "ThursA" : "available", "FriA" : "available", "FriB" : "available", "SatA" : "available"], staffShiftsBooked: [:])
//        masterStaffList.addStaff(staffFirstName: "Krista", staffLastName: "Icban", staffShiftsAvailable: ["SunA" : "available", "SunB" : "available", "MonA" : "available", "MonB" : "available", "TuesA" : "available", "TuesB" : "available"], staffShiftsBooked: [:])
        
                masterStaffList.addStaff(staffFirstName: "Hailey", staffLastName: "Ross", staffShiftsAvailable: ["MonC", "TuesC", "WedB", "ThursB", "FriC"], staffShiftsBooked: [:])
                masterStaffList.addStaff(staffFirstName: "Alivia", staffLastName: "Cohen", staffShiftsAvailable: ["WedA", "ThursA", "FriA", "FriB", "SatA"], staffShiftsBooked: [:])
                masterStaffList.addStaff(staffFirstName: "Rubie", staffLastName: "Haste", staffShiftsAvailable: ["SunA", "SunB", "MonA", "MonB", "TuesA", "TuesB"], staffShiftsBooked: [:])
                masterStaffList.addStaff(staffFirstName: "Lilly", staffLastName: "Ryman", staffShiftsAvailable: ["WedC", "ThursC", "SatC"], staffShiftsBooked: [:])
                masterStaffList.addStaff(staffFirstName: "Rose", staffLastName: "Panna", staffShiftsAvailable: ["MonC", "TuesC", "WedB", "ThursB", "FriC"], staffShiftsBooked: [:])
                masterStaffList.addStaff(staffFirstName: "Jayne", staffLastName: "Larson", staffShiftsAvailable: ["WedA", "ThursA", "FriA", "FriB", "SatA"], staffShiftsBooked: [:])
                masterStaffList.addStaff(staffFirstName: "Krista", staffLastName: "Icban", staffShiftsAvailable: ["SunA", "SunB", "MonA", "MonB", "TuesA", "TuesB"], staffShiftsBooked: [:])
    }
   
}
