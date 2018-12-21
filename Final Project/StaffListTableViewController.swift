//
//  StaffListTableViewController.swift
//  Final Project
//
//  Created by Elizabeth Boswell on 11/5/18.
//  Copyright © 2018 Elizabeth Boswell. All rights reserved.
//

import Foundation
import UIKit

class StaffListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("View Loaded")
    }
    
    // To occur when the view will becoming apparent.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Reload the data from the data source.
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // Make a title for each section
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        if section == 0 {
            label.text = "Summary of Staff"
        } else {
            label.text = "STAFF"
        }
        return label
    }
    
    // Specify the number of Sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // Specify the number of rows in each section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return ModelClientStaffScheduler.sharedInstance.masterStaffList.numberOfStaffs
        }
    }
    
    // Fill in the information in each cell in each section in the TableViewController
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellStyle:String = "basicCell"
        if indexPath.section == 1 {
            cellStyle = "rightDetailCell"
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellStyle, for: indexPath)
        
        if indexPath.section == 0 {
            // Display the number of Staff in Section 0
            cell.textLabel?.text = "We have " + "\(ModelClientStaffScheduler.sharedInstance.masterStaffList.numberOfStaffs)" + " Staff"
        } else {
            // Display each staff's first and last name in Section 1
            let staff = ModelClientStaffScheduler.sharedInstance.masterStaffList.getStaff(number: indexPath.row)
            cell.textLabel?.text = staff.staffFirstName
            cell.detailTextLabel?.text = staff.staffLastName
        }
        return cell
    }
}
