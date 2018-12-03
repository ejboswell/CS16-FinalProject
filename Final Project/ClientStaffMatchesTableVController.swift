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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = currentShift
        
        print(" CSMATCHEStvcYYYYYYYYYYYYYY this is currentClientinMatches from func viewdidload")
//        print(currentClientInMatches)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // The number of rows are the number of Staff that said they could work the particular shift.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        let c = ModelClientStaffScheduler.sharedInstance.masterScheduleList.findAllStaffs(shift: currentShift)
        print("CSMatchesTVC THE COUNT of POSSIBLE STAFF Is:")
        print(c.count)
        return c.count
    }

   // List using the reusableCell each Staff's name that said they could work the particular shift we are displaying in the title.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "rightDetailCell", for: indexPath)
        cell.backgroundColor = UIColor.white
        // Populate the detailTextLabel with the name of the staff
        cell.textLabel?.text = ModelClientStaffScheduler.sharedInstance.masterScheduleList.findAllStaffs(shift: currentShift)[indexPath.row].astaff?.staffFirstName
        // If the Schedule object has a non nil client property then display the client
        if ModelClientStaffScheduler.sharedInstance.masterScheduleList.findAllStaffs(shift: currentShift)[indexPath.row].aclient != nil {
            // Populate the detailTextLabel with the name of the client she is booked with for that shift
            cell.detailTextLabel?.text = ModelClientStaffScheduler.sharedInstance.masterScheduleList.findAllStaffs(shift: currentShift)[indexPath.row].aclient?.clientFirstName
            // Because the staff is booked display the cell's background color red.
            cell.backgroundColor = UIColor.red
        // Otherwise if the Schedule object's client property is equal to nil then display the word open and set the background color to white.
        } else {
            cell.detailTextLabel?.text = "open"
            cell.backgroundColor = UIColor.white
        }
        return cell
    }
     
     
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let staffInRow = ModelClientStaffScheduler.sharedInstance.masterScheduleList.findAllStaffs(shift: currentShift)[indexPath.row].astaff
        let booked = ModelClientStaffScheduler.sharedInstance.masterScheduleList.isClientBooked(aclient: currentClientInMatches, astaff: staffInRow!, shift: currentShift)
        let noClient = ModelClientStaffScheduler.sharedInstance.masterScheduleList.findAllStaffs(shift: currentShift)[indexPath.row].aclient
        // if the Schedule object's client property is nil and isClientBooked is false match the client and the staff by adding the Staff object to the present Schedule object's client property and eliminate the Schedule object that had just the shift and a Staff object in it. Then go back (pop) to the previous viewController.
        if noClient == nil && booked == false {
            ModelClientStaffScheduler.sharedInstance.masterScheduleList.makeAMatch(aclient: currentClientInMatches, astaff: staffInRow!, shift: currentShift)
            navigationController?.popViewController(animated: true)
        // otherwise all three properties are not nil which means the staff is booked and send an alert regarding that.
        } else {
            print("CSMatchesTVCREDDDDDD")
            let alert = UIAlertController(title: "This Staff/Client is already booked", message: "Try again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: { (action) in
                self.navigationController?.popViewController(animated: true)
            }))
            present(alert, animated: true)

        }
    }
    


    
    
    
    
    
    
    
    
    
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
