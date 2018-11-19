//
//  StaffList.swift
//  Final Project
//
//  Created by Elizabeth Boswell on 11/5/18.
//  Copyright © 2018 Elizabeth Boswell. All rights reserved.
//

import Foundation

class StaffList {
    var staffs: [Staff] = []
    
// When called func addStaff  instantiates (makes) a new instance of Staff
//    func addStaff(staffFirstName: String, staffLastName: String, staffShiftsAvailable: [String:String] = [:], staffShiftsBooked: [String:String] = [:])  {
//        let c = Staff(staffFirstName: staffFirstName, staffLastName: staffLastName, staffShiftsAvailable: staffShiftsAvailable, staffShiftsBooked: staffShiftsBooked)
        func addStaff(staffFirstName: String, staffLastName: String, staffShiftsAvailable: [String] = [], staffShiftsBooked: [String:Client] = [:]) -> Staff  {
            let c = Staff(staffFirstName: staffFirstName, staffLastName: staffLastName, staffShiftsAvailable: staffShiftsAvailable, staffShiftsBooked: staffShiftsBooked)
    
        staffs.append(c)
        return c
    }
    
    func getStaff(number:Int) -> Staff {
        return staffs[number]
    }
    
    // computed properties
    var numberOfStaffs: Int {
        return staffs.count
    }
    
    
    
}
