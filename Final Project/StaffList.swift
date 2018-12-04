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
    
    // When called func addStaff  instantiates (makes) a new instance of Staff.  It is called from the Model and also the StaffScheduleViewController when getting info from the user.
    func addStaff(staffFirstName: String, staffLastName: String, staffShiftsAvailable: [String] = [], staffShiftsBooked: [String:Client] = [:]) -> Staff  {
        let c = Staff(staffFirstName: staffFirstName, staffLastName: staffLastName, staffShiftsAvailable: staffShiftsAvailable, staffShiftsBooked: staffShiftsBooked)
        
        staffs.append(c)
        return c
    }
    
   //  When called func getStaff returns a single instance of Staff from the array staffs.   It assists in filling in CellForRow at IndexPath and the prepare for segue in StaffListTableViewController
    func getStaff(number:Int) -> Staff {
        return staffs[number]
    }
    
    // This computed property returns the number of elements in the array clients. Used to set up the number of rows in the StaffListTableViewController.
    var numberOfStaffs: Int {
        return staffs.count
    }
}
