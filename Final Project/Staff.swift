//
//  Staff.swift
//  Final Project
//
//  Created by Elizabeth Boswell on 11/5/18.
//  Copyright © 2018 Elizabeth Boswell. All rights reserved.
//

import Foundation

class Staff {
    var staffFirstName:  String = ""
    var staffLastName:  String = ""
    var staffShiftsAvailable: [String] = []
    var staffShiftsBooked: [String:Client?] = [:]
    
    init(staffFirstName: String, staffLastName: String, staffShiftsAvailable: [String], staffShiftsBooked: [String:Client?]) {
        self.staffFirstName = staffFirstName
        self.staffLastName = staffLastName
        self.staffShiftsAvailable = staffShiftsAvailable
        self.staffShiftsBooked = staffShiftsBooked
    }
    
    
}
//struct Staff {
//    var staffFirstName:  String = ""
//    var staffLastName:  String = ""
//    var staffShiftsAvailable: [String] = []
////    var staffShiftsAvailable: [String:String] = [:]
//    var staffShiftsBooked: [String:Client] = [:]
//
//

//
//}
//var staffFirstName:  String = ["Hailey", "Lindsey", "Lauren", "Carli", "Kasha", "Harmony"]
//var staffLastName:  String = ["Knolls", "Rice", "Kachel", "Sanchez", "Smith", "Purdue"]
