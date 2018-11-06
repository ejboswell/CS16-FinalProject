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
    
    func addStaff(staffFirstName: String, staffLastName: String)  {
        let c = Staff(staffFirstName: staffFirstName, staffLastName: staffLastName)
        staffs.append(c)
    }
    
    func getStaff(number:Int) -> Staff {
        return staffs[number]
    }
    
    // computed properties
    var numberOfStaffs: Int {
        return staffs.count
    }
    
    
    
}
