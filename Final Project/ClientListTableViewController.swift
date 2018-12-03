//
//  ClientListTableViewController.swift
//  Final Project
//
//  Created by Elizabeth Boswell on 11/5/18.
//  Copyright © 2018 Elizabeth Boswell. All rights reserved.
//

import UIKit

class ClientListTableViewController: UITableViewController, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // Specific the Header for each of the 2 sections
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
    
    // Number of rows for the 2nd section is the number of clients.
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
        // The cells for the two sections are different.  In section 0 the cell is a regular cell with some info in it.  In section 2 there are 2 labels and 1 imageview each having a gesture recognizer that if gestured segues to a new viewController.  The image and the addressLabel are  a two click gesture that segues to the same new viewController and the nameLabel is set up with a 1 click gesture that segues to the client shift detail viewController.
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
            
            setUpHouseRecognizer(cell, indexPath)
            setUpAddressRecognizer(cell, indexPath)
            setUpClientNameRecognizer(cell, indexPath)
            
            return cell
            
            
//            cell.setName(client: client)
            
//            cell.textLabel?.text = client.clientFirstName
//            cell.detailTextLabel?.text = client.clientLastName
        }
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellStyle, for: indexPath)
//        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//         performSegue(withIdentifier: "toClientShiftDetail", sender: self)
//    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toClientShiftDetail" {
            var senderAsIndexPath = sender as! IndexPath
            let rowNumber = senderAsIndexPath.row
            let nextController = segue.destination as! ClientShiftDetailTableVController
            nextController.currentClient = ModelClientStaffScheduler.sharedInstance.masterClientList.getClient(number: rowNumber)
        } else if segue.identifier == "toClientAddressMap" {
            var senderAsIndexPath = sender as! IndexPath
            let rowNumber = senderAsIndexPath.row
                let nextController = segue.destination as! ClientAddressMapViewController
                nextController.currentClient = ModelClientStaffScheduler.sharedInstance.masterClientList.getClient(number: rowNumber)
        }
    
    }
    
    
    @objc
    func houseClicked2(tapGesture:UITapGestureRecognizer){
        print("CListTVC House Image tag is:\(tapGesture.view!.tag)")
        let c = ModelClientStaffScheduler.sharedInstance.masterClientList.getClient(number: tapGesture.view!.tag)
        print(c.clientStreet)
        let indexPathForSender = IndexPath(row: tapGesture.view!.tag, section: 1)
        performSegue(withIdentifier: "toClientAddressMap", sender: indexPathForSender)
    }
    
    fileprivate func setUpHouseRecognizer(_ cell: ClientAddressTableViewCell, _ indexPath: IndexPath) {
        // create gesture recognizer with selector houseClicked2 (kind of like an IBAction but gives me a tag i.e. a indexPath.row
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(houseClicked2(tapGesture:)))
        // run a method in this viewController
        tapGesture.delegate = self
        tapGesture.numberOfTapsRequired = 2
        cell.houseImage.isUserInteractionEnabled = true
        // Tag is a property of the object houseImage that holds who is is. It's unique identifier.
        cell.houseImage.tag = indexPath.row
        // Add the tap recognizer to houseImage
        cell.houseImage.addGestureRecognizer(tapGesture)
    }
    
    
    @objc
    func addressClicked2(tapGesture:UITapGestureRecognizer){
        print("Address Label tag is:\(tapGesture.view!.tag)")
    }
    
    fileprivate func setUpAddressRecognizer(_ cell: ClientAddressTableViewCell, _ indexPath: IndexPath) {
        // create gesture recognizer with selector houseClicked2 (kind of like an IBAction but gives me a tag i.e. a indexPath.row
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(addressClicked2(tapGesture:)))
        // run a method in this viewController
        tapGesture.delegate = self
        tapGesture.numberOfTapsRequired = 2
        cell.addressLabel.isUserInteractionEnabled = true
        // tag is a property of the object houseImage that holds who is is.it unique identifier
        cell.addressLabel.tag = indexPath.row
        // add the tap recognizer to houseImage
        cell.addressLabel.addGestureRecognizer(tapGesture)
    }
    
    
    // When the clientName is clicked once collect the indexPath coordinate then perform the Segue with the correct indexPath coordinate.
    @objc
    func clientNameClicked1(tapGesture:UITapGestureRecognizer){
        print("ClientName Label tag is:\(tapGesture.view!.tag)")
        let indexPathForSender = IndexPath(row: tapGesture.view!.tag, section: 1)
        performSegue(withIdentifier: "toClientShiftDetail", sender: indexPathForSender)
    }
    
    fileprivate func setUpClientNameRecognizer(_ cell: ClientAddressTableViewCell, _ indexPath: IndexPath) {
        // create gesture recognizer with selector houseClicked2 (kind of like an IBAction but gives me a tag i.e. a indexPath.row
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(clientNameClicked1(tapGesture:)))
        // run a method in this viewController
        tapGesture.delegate = self
        tapGesture.numberOfTapsRequired = 1
        cell.nameLabel.isUserInteractionEnabled = true
        // tag is a property of the object houseImage that holds who is is.it unique identifier
        cell.nameLabel.tag = indexPath.row
        // add the tap recognizer to houseImage
        cell.nameLabel.addGestureRecognizer(tapGesture)
    }
    
    
    
    
    
//
//    You can use the identifier, but I hate using string identifiers and its not very swifty. I find I almost always disambiguate the segue by checking the type of the destination viewcontroller with as? and the type of the sender with is or (as in the case of multiply UIButtons) operator ===.
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? DetailViewController {
//            if sender is UITableViewCell {
//                destination.mode = .view
//            } else if sender === plusButton {
//                destination.mode = .add
//            } else if sender === editButton {
//                destination.mode = .edit
//            }
//        }
//    }
}
