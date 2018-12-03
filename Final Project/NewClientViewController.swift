//
//  NewClientViewController.swift
//  Final Project
//
//  Created by Elizabeth Boswell on 11/7/18.
//  Copyright © 2018 Elizabeth Boswell. All rights reserved.
//


import UIKit

class NewClientViewController: UIViewController {
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var clientStreetTextField: UITextField!
    
    @IBOutlet weak var clientCityTextField: UITextField!
    
    @IBOutlet weak var clientStateTextField: UITextField!
    
    @IBOutlet weak var clientZipTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Add a Client"
        self.navigationItem.rightBarButtonItem?.title = "Done"
    
}
   
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        if firstNameTextField.text != "" && lastNameTextField.text != "" {
            let c = ModelClientStaffScheduler.sharedInstance.masterClientList.addClient(clientFirstName: firstNameTextField.text!, clientLastName: lastNameTextField.text!, clientStreet: clientStreetTextField.text!, clientCity: clientCityTextField.text!, clientState: clientStateTextField.text!, clientZip: Int(clientZipTextField.text!)!, hasCaregiver: ["SunA" : nil, "SunB" : nil,"SunC" : nil, "MonA" : nil, "MonB" : nil, "MonC" : nil, "TuesA" : nil, "TuesB" : nil, "TuesC" : nil, "WedA" : nil,  "WedB" : nil, "WedC" : nil, "ThursA" : nil, "ThursB" : nil, "ThursC" : nil, "FriA" : nil, "FriB" : nil, "FriC" : nil, "SatA" : nil, "SatB" : nil, "SatC" : nil])
            ModelClientStaffScheduler.sharedInstance.masterScheduleList.addANewClientSchedule(aclient: c)
            firstNameTextField.text = ""
            lastNameTextField.text = ""
            
        } else {
            messageLabel.text = "Enter all information"
        }
    }
    
    
    @IBAction func DoneAddingclient(_ sender: UIBarButtonItem) {
        if firstNameTextField.text != "" && lastNameTextField.text != "" && clientStreetTextField.text != "" && clientCityTextField.text != "" && clientStateTextField.text != "" && clientZipTextField.text != "" {
            let c = ModelClientStaffScheduler.sharedInstance.masterClientList.addClient(clientFirstName: firstNameTextField.text!, clientLastName: lastNameTextField.text!,clientStreet: clientStreetTextField.text!, clientCity: clientCityTextField.text!, clientState: clientStateTextField.text!, clientZip: Int(clientZipTextField.text!)!, hasCaregiver: ["SunA" : nil, "SunB" : nil,"SunC" : nil, "MonA" : nil, "MonB" : nil, "MonC" : nil, "TuesA" : nil, "TuesB" : nil, "TuesC" : nil, "WedA" : nil,  "WedB" : nil, "WedC" : nil, "ThursA" : nil, "ThursB" : nil, "ThursC" : nil, "FriA" : nil, "FriB" : nil, "FriC" : nil, "SatA" : nil, "SatB" : nil, "SatC" : nil])
            ModelClientStaffScheduler.sharedInstance.masterScheduleList.addANewClientSchedule(aclient: c)
            firstNameTextField.text = ""
            lastNameTextField.text = ""
            navigationController?.popViewController(animated: true)
            
        } else {
            let alert = UIAlertController(title: "Enter all information", message: "Try Again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
            present(alert, animated: true)
            messageLabel.text = "Enter all information"
        }
    }
}
