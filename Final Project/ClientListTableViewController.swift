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
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return ModelClientStaffScheduler.sharedInstance.masterClientList.numberOfClients
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellStyle: String = "basicCell"
        if indexPath.section == 1 {
            //cellStyle = "rightDetailCell"
            cellStyle = "clientAddressCell"
        }
//       let cell = tableView.dequeueReusableCell(withIdentifier: cellStyle, for: indexPath)
//        cell.backgroundColor = UIColor.white
        if indexPath.section == 0 {
           let cell = tableView.dequeueReusableCell(withIdentifier: cellStyle, for: indexPath)
            cell.backgroundColor = UIColor.white
            cell.textLabel?.text = "We have " +
                "\(ModelClientStaffScheduler.sharedInstance.masterClientList.numberOfClients)" + " Clients"
            return cell
        } else {
           let cell = tableView.dequeueReusableCell(withIdentifier: cellStyle, for: indexPath) as! ClientAddressTableViewCell
            let client = ModelClientStaffScheduler.sharedInstance.masterClientList.getClient(number: indexPath.row)
            cell.nameLabel.text = ("\(client.clientFirstName)" + " " + "\(client.clientLastName)")
            return cell
//            cell.setName(client: client)
            
//            cell.textLabel?.text = client.clientFirstName
//            cell.detailTextLabel?.text = client.clientLastName
        }
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellStyle, for: indexPath)
//        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         performSegue(withIdentifier: "toClientShiftDetail", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toClientShiftDetail" {
        let rowNumber = tableView.indexPathForSelectedRow!.row
        let nextController = segue.destination as! ClientShiftDetailTableVController
        nextController.currentClient = ModelClientStaffScheduler.sharedInstance.masterClientList.getClient(number: rowNumber)
        }
    }
}
