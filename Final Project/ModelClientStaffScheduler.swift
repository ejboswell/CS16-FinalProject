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
    var masterScheduleList = ScheduleList()

    // Setting up the first two clients for presentation purposes
    init() {
        let c = masterClientList.addClient(clientFirstName: "Michelle", clientLastName: "Smith", clientStreet: "1605 Lexington Lane", clientCity: "Pleasanton", clientState: "CA", clientZip: 94588, hasCaregiver:["SunA" : nil, "SunB" : nil,"SunC" : nil, "MonA" : nil, "MonB" : nil, "MonC" : nil, "TuesA" : nil, "TuesB" : nil, "TuesC" : nil, "WedA" : nil,  "WedB" : nil, "WedC" : nil, "ThursA" : nil, "ThursB" : nil, "ThursC" : nil, "FriA" : nil, "FriB" : nil, "FriC" : nil, "SatA" : nil, "SatB" : nil, "SatC" : nil])
        
        masterScheduleList.addANewClientSchedule(aclient: c)
        
        let c2 = masterClientList.addClient(clientFirstName: "Ellie", clientLastName: "Black",clientStreet: "4863 Willow Road", clientCity: "Pleasanton", clientState: "CA", clientZip: 94588, hasCaregiver: ["SunA" : nil, "SunB" : nil, "SunC" : nil ,"MonA" : nil, "MonB" : nil, "MonC" : nil, "TuesA" : nil, "TuesB" : nil, "TuesC" : nil, "WedA" : nil,  "WedB" : nil, "WedC" : nil, "ThursA" : nil, "ThursB" : nil, "ThursC" : nil, "FriA" : nil, "FriB" : nil, "FriC" : nil, "SatA" : nil, "SatB" : nil, "SatC" : nil])
        
        masterScheduleList.addANewClientSchedule(aclient: c2)
        // Setting up 7 initial Staff Objects for presentation purposes
        let s1 = masterStaffList.addStaff(staffFirstName: "Hailey", staffLastName: "Ross", staffShiftsAvailable: ["MonC", "TuesC", "WedB", "ThursB", "FriC"], staffShiftsBooked: [:])
        let s2 = masterStaffList.addStaff(staffFirstName: "Alivia", staffLastName: "Cohen", staffShiftsAvailable: ["WedA", "ThursA", "FriA", "FriB", "SatA"], staffShiftsBooked: [:])
        let s3 = masterStaffList.addStaff(staffFirstName: "Rubie", staffLastName: "Haste", staffShiftsAvailable: ["SunA", "SunB", "MonA", "MonB", "TuesA", "TuesB"], staffShiftsBooked: [:])
        let s4 = masterStaffList.addStaff(staffFirstName: "Lilly", staffLastName: "Ryman", staffShiftsAvailable: ["WedC", "ThursC", "SatC"], staffShiftsBooked: [:])
        let s5 = masterStaffList.addStaff(staffFirstName: "Rose", staffLastName: "Panna", staffShiftsAvailable: ["MonC", "TuesC", "WedB", "ThursB", "FriC"], staffShiftsBooked: [:])
        let s6 = masterStaffList.addStaff(staffFirstName: "Jayne", staffLastName: "Larson", staffShiftsAvailable: ["WedA", "ThursA", "FriA", "FriB", "SatA"], staffShiftsBooked: [:])
        let s7 = masterStaffList.addStaff(staffFirstName: "Krista", staffLastName: "Icban", staffShiftsAvailable: ["SunA", "SunB", "MonA", "MonB", "TuesA", "TuesB"], staffShiftsBooked: [:])
       // Setting up 7 initial Schedule objects for the 7 initial staff members
        let s1s = s1.staffShiftsAvailable
        masterScheduleList.addANewStaffSchedule(astaff: s1, shifts: s1s)
        let s2s = s2.staffShiftsAvailable
        masterScheduleList.addANewStaffSchedule(astaff: s2, shifts: s2s)
        let s3s = s3.staffShiftsAvailable
        masterScheduleList.addANewStaffSchedule(astaff: s3, shifts: s3s)
        let s4s = s4.staffShiftsAvailable
        masterScheduleList.addANewStaffSchedule(astaff: s4, shifts: s4s)
        let s5s = s5.staffShiftsAvailable
        masterScheduleList.addANewStaffSchedule(astaff: s5, shifts: s5s)
        let s6s = s6.staffShiftsAvailable
        masterScheduleList.addANewStaffSchedule(astaff: s6, shifts: s6s)
        let s7s = s7.staffShiftsAvailable
        masterScheduleList.addANewStaffSchedule(astaff: s7, shifts: s7s)
    }
}








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

