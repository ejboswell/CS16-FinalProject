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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Add a Client"
        self.navigationItem.rightBarButtonItem?.title = "Done"
    
}
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        
        if firstNameTextField.text != "" && lastNameTextField.text != "" {
            let c = ModelClientStaffScheduler.sharedInstance.masterClientList.addClient(clientFirstName: firstNameTextField.text!, clientLastName: lastNameTextField.text!, hasCaregiver: ["SunA" : nil, "SunB" : nil,"SunC" : nil, "MonA" : nil, "MonB" : nil, "MonC" : nil, "TuesA" : nil, "TuesB" : nil, "TuesC" : nil, "WedA" : nil,  "WedB" : nil, "WedC" : nil, "ThursA" : nil, "ThursB" : nil, "ThursC" : nil, "FriA" : nil, "FriB" : nil, "FriC" : nil, "SatA" : nil, "SatB" : nil, "SatC" : nil])
            ModelClientStaffScheduler.sharedInstance.masterScheduleList.addANewClientSchedule(aclient: c)

            
        } else {
            messageLabel.text = "Enter all information"
        }
    }
    
    @IBAction func doneEnteringNewClientTapped(_ sender: UIBarButtonItem) {
       
        if firstNameTextField.text != "" && lastNameTextField.text != "" {
            ModelClientStaffScheduler.sharedInstance.masterClientList.addClient(clientFirstName: firstNameTextField.text!, clientLastName: lastNameTextField.text!, hasCaregiver: [:])

        
            
        } else {
            messageLabel.text = "Enter all information"
        }
        
    }
}
