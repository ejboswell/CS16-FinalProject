//
//  ClientStaffMatchesTableVController.swift
//  Final Project
//
//  Created by Elizabeth Boswell on 11/16/18.
//  Copyright © 2018 Elizabeth Boswell. All rights reserved.
//

import UIKit

class ClientStaffMatchesTableVController: UITableViewController {
    
    var currentClientInMatches: Client!
    var currentShift: String!
//    var currentPossibleStaff: [Staff] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        findStaff(shift: currentShift)
        print("YYYYYYYYYYYYYY this is currentClientinMatches from func viewdidload")
//        print(currentClientInMatches)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("THE COUNT of POSSIBLE STAFF Is:")
//        print(currentPossibleStaff.count)

        
        let c = ModelClientStaffScheduler.sharedInstance.masterScheduleList.findAllStaffs(shift: currentShift)
        return c.count
        
//       return currentPossibleStaff.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "rightDetailCell", for: indexPath)
        cell.backgroundColor = UIColor.white
        cell.textLabel?.text = ModelClientStaffScheduler.sharedInstance.masterScheduleList.findAllStaffs(shift: currentShift)[indexPath.row].astaff?.staffFirstName

        
        if ModelClientStaffScheduler.sharedInstance.masterScheduleList.findAllStaffs(shift: currentShift)[indexPath.row].aclient != nil {
             let clientName = ModelClientStaffScheduler.sharedInstance.masterScheduleList.findAllStaffs(shift: currentShift)[indexPath.row].aclient?.clientFirstName
            print(clientName)
            cell.detailTextLabel?.text = ModelClientStaffScheduler.sharedInstance.masterScheduleList.findAllStaffs(shift: currentShift)[indexPath.row].aclient?.clientFirstName
            cell.backgroundColor = UIColor.red
        
        
//        cell.textLabel!.text! = currentPossibleStaff[indexPath.row].staffFirstName
//        if currentPossibleStaff[indexPath.row].staffShiftsBooked[currentShift] != nil {
//            let x = currentPossibleStaff[indexPath.row].staffShiftsBooked[currentShift]
//            cell.detailTextLabel?.text = x??.clientFirstName
        
//            cell.backgroundColor = UIColor.yellow
        } else {
            cell.detailTextLabel?.text = "open"
            cell.backgroundColor = UIColor.white
        }
        return cell
    }
     
     
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let staffInRow = ModelClientStaffScheduler.sharedInstance.masterScheduleList.findAllStaffs(shift: currentShift)[indexPath.row].astaff
        ModelClientStaffScheduler.sharedInstance.masterScheduleList.makeAMatch(aclient: currentClientInMatches, astaff: staffInRow!, shift: currentShift)
        

//        currentPossibleStaff[indexPath.row].staffShiftsBooked[currentShift] = currentClientInMatches
//
//        currentClientInMatches.hasCaregiver[currentShift] = currentPossibleStaff[indexPath.row]
//        for item in currentClientInMatches.hasCaregiver {
//            print("HAS CAREGIVER DICT:")
//            print(item)
//        }
//        for item in currentPossibleStaff[indexPath.row].staffShiftsBooked {
//            print("WHAT IS IN STAFFSHIFTSBOOKED")
//            print(item)
//        }
        performSegue(withIdentifier: "backToClientShiftDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let rowNumber = tableView.indexPathForSelectedRow!.row
        let nextController = segue.destination as! ClientShiftDetailTableVController
//        nextController.currentStaffBooked = currentPossibleStaff[tableView.indexPathForSelectedRow!.row]
        print("I'm in the prepare for segue and I'm sending the currentStaffBooked")
        let i =  ModelClientStaffScheduler.sharedInstance.masterScheduleList.findAllStaffs(shift: currentShift)[tableView.indexPathForSelectedRow!.row].astaff
        print(i)
        
        nextController.currentStaffBooked = ModelClientStaffScheduler.sharedInstance.masterScheduleList.findAllStaffs(shift: currentShift)[tableView.indexPathForSelectedRow!.row].astaff
        
        print("I'm in the prepare for segue and I'm sending the currentclient")
        print(currentClientInMatches)
        
        nextController.currentClient = currentClientInMatches
        
        nextController.currentShift = currentShift
    }
  
//
//    func findStaff(shift:String) -> [Staff] {
//        for object in ModelClientStaffScheduler.sharedInstance.masterStaffList.staffs {
////            print("This is going to be a object " + "\(object)")
//            if object.staffShiftsAvailable.contains(shift) {
//                currentPossibleStaff.append(object)
//
//            }
////            for item in currentPossibleStaff {
////                print("HERE ARE THE MATCHES")
////                print(item)
////            }
//
//        }
//        return currentPossibleStaff
//    }

    
    
    
    
    
    
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}