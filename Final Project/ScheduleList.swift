//
//  ScheduleList.swift
//  Final Project
//
//  Created by Elizabeth Boswell on 11/17/18.
//  Copyright © 2018 Elizabeth Boswell. All rights reserved.
//

import Foundation

class ScheduleList {
    
    var schedules: [Schedule] = []
    
//    var foundShifts: [Schedule]
//    var bookedShifts: [Schedule]
//    var availableShifts: [Schedule]
//
//    init(foundShifts:[Schedule]) {
//        self.foundShifts = foundShifts
//    }
//
//    init(bookedShifts:[Schedule]) {
//        self.bookedShifts = bookedShifts
//    }
//
//    init(availableShifts: [Schedule]) {
//        self.availableShifts = availableShifts
//    }
    
    func addANewClientSchedule(aclient:Client)  {
        let shifts = ["SunA", "SunB","SunC", "MonA", "MonB", "MonC", "TuesA", "TuesB", "TuesC", "WedA",  "WedB", "WedC", "ThursA", "ThursB", "ThursC", "FriA", "FriB", "FriC", "SatA", "SatB", "SatC"]
        for shift in shifts {
            let cs = Schedule(aclient: aclient, astaff: nil, ashift: shift)
            schedules.append(cs)
            print(schedules)
        }
    }
    
    func addANewStaffSchedule(astaff:Staff, shifts: [String]) {
        for  shift in shifts {
            let ss = Schedule(aclient: nil, astaff: astaff, ashift: shift)
            schedules.append(ss)
            print(schedules)
        }
    }
  //  This function finds all the staff that "could" work the shift.  Some staff may be other clients which is needed for user information purposes
    func findAllStaffs(shift:String) -> [Schedule]  {
        var foundShifts: [Schedule] = []
        for bigobject in schedules {
//            for shift in bigobject.ashift {
                if bigobject.ashift == shift {
                foundShifts.append(bigobject)
                }
        }
      return foundShifts
    }
    
    func FindBookedStaffs(shift:String) {
        let allStaff = findAllStaffs(shift: shift)
        for bigobject in allStaff {
            if bigobject.aclient != nil {
                
            }
        }
    }
    
    func makeAMatch(aclient: Client, astaff: Staff, shift: String) {
        for bigobject in schedules {
            if bigobject.aclient?.clientFirstName == aclient.clientFirstName
                && bigobject.aclient?.clientLastName == aclient.clientLastName
                && bigobject.ashift == shift
                && bigobject.astaff == nil {
                
                bigobject.astaff = astaff
            }
            if bigobject.astaff?.staffFirstName == astaff.staffFirstName
                && bigobject.astaff?.staffLastName == astaff.staffLastName
                && bigobject.ashift == shift
                && bigobject.aclient == nil {
//  Now that we have added at Staff to a nil Staff with a Client remove the extra object that just had Staff and shift.
                if let index = schedules.index(where: { $0 === bigobject}) {
                    
                    schedules.remove(at: index)
                    print(" YOU DISPOSED OF the extra object that had only STAFF and shift (Client was nil)")
                }
            }
        }
    }


        
}
