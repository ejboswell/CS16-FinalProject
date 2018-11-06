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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        if section == 0 {
            label.text = "Summary of Staff"
        } else {
            label.text = "STAFF"
        }
        return label
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return ModelClientStaffScheduler.sharedInstance.masterStaffList.numberOfStaffs
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellStyle:String = "basicCell"
        if indexPath.section == 1 {
            cellStyle = "rightDetailCell"
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellStyle, for: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = "We have " + "\(ModelClientStaffScheduler.sharedInstance.masterStaffList.numberOfStaffs)" + " Staff"
        } else {
            let staff = ModelClientStaffScheduler.sharedInstance.masterStaffList.getStaff(number: indexPath.row)
            cell.textLabel?.text = staff.staffFirstName
            cell.detailTextLabel?.text = staff.staffLastName
        }
        return cell
    }
}
