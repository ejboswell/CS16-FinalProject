//
//  ClientShiftDetailTableVController.swift
//  Final Project
//
//  Created by Elizabeth Boswell on 11/15/18.
//  Copyright © 2018 Elizabeth Boswell. All rights reserved.
//

import UIKit

class ClientShiftDetailTableVController: UITableViewController {
// from prepare for segue in ClientListTableViewController
    var currentClient : Client!
    
    
// from prepare for segue in ClientStaffMatchesTableVController
    var currentStaffBooked: Staff!
    var currentShift: String!
    var currentClientFromMatches: Client!
    
    var shifts: [String] = ["SunA", "SunB","SunC", "MonA", "MonB", "MonC", "TuesA", "TuesB", "TuesC", "WedA", "WedB", "WedC", "ThursA", "ThursB", "ThursC", "FriA", "FriB", "FriC", "SatA", "SatB", "SatC"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
       self.navigationItem.title = ("\(currentClient.clientFirstName)" + " Shifts")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 21
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print("in cell for row at indexpath")
//        print(shifts[indexPath.row])
        let cell = tableView.dequeueReusableCell(withIdentifier: "rightDetailCell", for: indexPath)
// C will be an array of Schedule
        let c = ModelClientStaffScheduler.sharedInstance.masterScheduleList.clientStaffDetailInfo(theClient: currentClient)
        cell.backgroundColor = UIColor.white
        cell.textLabel?.text = c.schedules[indexPath.row].ashift
        print(" Hellllllooooo  \(currentShift)")
// If Staff object in the array is not empty put in the staff name and make background color yellow
        if c.schedules[indexPath.row].astaff != nil {
            cell.detailTextLabel?.text = c.schedules[indexPath.row].astaff?.staffFirstName
            cell.backgroundColor = UIColor.yellow
// Otherwise put "open" and make backgroundcolor white
        } else {
            cell.detailTextLabel?.text = "open"
            cell.backgroundColor = UIColor.white
        }
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toClientStaffMatches", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let rowNumber = tableView.indexPathForSelectedRow!.row
        let nextController = segue.destination as! ClientStaffMatchesTableVController
        // Send the next Controller the currentClient and the current shift
        nextController.currentClientInMatches = currentClient
        nextController.currentShift = shifts[rowNumber]
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
