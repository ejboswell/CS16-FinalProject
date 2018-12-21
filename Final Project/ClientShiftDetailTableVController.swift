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

    // Set up number of Sections in the TableView
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // Set up number of rows which will be 21 for the 21 shifts per week.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
        //print(" Hellllllooooo  \(currentShift)")
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
    
    // If user selects the row go to ClientStaffMatches View
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toClientStaffMatches", sender: nil)
    }
    
    // Make sure the next ViewController has the current information (the current Client (the one we are presently working on)  and current shift)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let rowNumber = tableView.indexPathForSelectedRow!.row
        let nextController = segue.destination as! ClientStaffMatchesTableVController
        // Send the next Controller the currentClient and the current shift
        nextController.currentClientInMatches = currentClient
        nextController.currentShift = shifts[rowNumber]
    }
}
