//
//  ClientListTableViewController.swift
//  Final Project
//
//  Created by Elizabeth Boswell on 11/5/18.
//  Copyright © 2018 Elizabeth Boswell. All rights reserved.
//

import UIKit

class ClientListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        if section == 0 {
            label.text = "Summary of Clients"
        } else {
            label.text = "CLIENTS"
        }
        return label
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        print("table is asking how many sections")
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 2
            
            //return ClientList.shareInstance.numberOfClients()
            
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellStyle: String = "basicCell"
        if indexPath.section == 1 {
            cellStyle = "rightDetailCell"
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellStyle, for: indexPath)
        if indexPath.section == 0 {
            cell.textLabel?.text = "summary"
        } else {
            let client = ModelClientStaffScheduler.sharedInstance.masterClientList.getClient(number: indexPath.row)
            cell.textLabel?.text = client.clientFirstName
            cell.detailTextLabel?.text = client.clientLastName
        }
        return cell
    }
}