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
    
    
// This function adds a new client. It will make 21 Schedule objects each with the Client, the Staff will be nil (as the shift is still open) and each of the 21 objects will have a different shift.
    func addANewClientSchedule(aclient:Client)  {
        let shifts = ["SunA", "SunB","SunC", "MonA", "MonB", "MonC", "TuesA", "TuesB", "TuesC", "WedA",  "WedB", "WedC", "ThursA", "ThursB", "ThursC", "FriA", "FriB", "FriC", "SatA", "SatB", "SatC"]
        for shift in shifts {
            let cs = Schedule(aclient: aclient, astaff: nil, ashift: shift)
            schedules.append(cs)
//            print(schedules)
        }
    }
// This function adds a new Staff. It will make as many Schedule objects as shifts they signed up for. Each object will have a Staff and a different shift but the Client will be nil (as the Staff has not been matched with a client yet).
    func addANewStaffSchedule(astaff:Staff, shifts: [String]) {
        for  shift in shifts {
            let ss = Schedule(aclient: nil, astaff: astaff, ashift: shift)
            schedules.append(ss)
//            print(schedules)
        }
    }
  //  This function finds all the staff that "could" work the shift.  Some staff may be booked with other clients which is needed for user information purposes
    func findAllStaffs(shift:String) -> [Schedule]  {
        var foundShifts: [Schedule] = []
        for bigobject in schedules {

            if bigobject.ashift == shift && (bigobject.astaff != nil) {
//                    && (bigobject.aclient !== nil {
                foundShifts.append(bigobject)
                }
        }
      return foundShifts
    }
    
    
// This function calls findAllStaffs and returns only the staff could work the shift but are presently booked with a client
    func FindBookedStaffs(shift:String) -> [Schedule] {
        var bookedStaffs: [Schedule] = []
        let allStaff = findAllStaffs(shift: shift)
        for bigobject in allStaff {
            if bigobject.aclient != nil {
                bookedStaffs.append(bigobject)
            }
        }
        return bookedStaffs
    }
    
    func FindbookedStaffsFirstAndLast(shift:String) -> [String] {
        var firstLast: [String] = []
        let bookedStaff = FindBookedStaffs(shift: shift)
        for object in bookedStaff {
            if object.astaff != nil {
                firstLast.append("\(object.astaff?.staffFirstName)" + " " + "\(object.astaff?.staffLastName)")
            }
        }
        return firstLast
    }
    
// This function calls findAllStaffs and return only the staff members that can work the shift and are NOT presently booked a client
    func FindAvailableStaffs(shift:String) -> [Schedule] {
        var availableStaffs: [Schedule] = []
        let allStaff = findAllStaffs(shift: shift)
        for bigobject in allStaff {
            if bigobject.aclient == nil {
                availableStaffs.append(bigobject)
            }
        }
        return availableStaffs
    }
    
// This function sends true if the Client is already booked for the particular shift
    func isClientBooked(aclient:Client, astaff:Staff, shift:String) -> Bool {
        let thisShiftSchedule: [Schedule] = findAllStaffs(shift: shift)
        for object in thisShiftSchedule {
            if object.aclient === aclient && object.astaff != nil {
                return true
            }
        }
        return false
    }
    
    
// This function finds a staff for a client for a particular shift. Then it adds a staff to the object that has only a Client and the specified shift. (So now that object has no nil values) and then it removes the object that had only the Staff and the specified shift. (So now the staff no longer has availability during the specified shift)
    func makeAMatch(aclient: Client, astaff: Staff, shift: String) {
//        if isClientBooked(aclient: aclient, astaff: astaff, shift: shift) == false {
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
//        }
        }
    }

    func clientStaffDetailInfo(theClient: Client) -> ScheduleList {
        let result: ScheduleList = ScheduleList()
        for item in ModelClientStaffScheduler.sharedInstance.masterScheduleList.schedules {
            if item.aclient === theClient {
                result.schedules.append( item )
            }
        }
        return result
    }
    
//    func clientStaffDetailInfo(theClient: Client) -> [Schedule] {
//        let result: [Schedule] = []
//        for item in ModelClientStaffScheduler.sharedInstance.masterScheduleList.schedules {
//            if item.aclient === theClient {
//                schedules.append(item)
//            }
//        }
//        return result
//    }
    
}
