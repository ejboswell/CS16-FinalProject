//
//  ViewController.swift
//  Final Project
//
//  Created by Elizabeth Boswell on 11/4/18.
//  Copyright © 2018 Elizabeth Boswell. All rights reserved.
//

import UIKit

class StaffScheduleViewController: UIViewController {

    // Properties of the StaffScheduleViewController
    @IBOutlet weak var fNameTextField: UITextField!
    
    @IBOutlet weak var lNameTextField: UITextField!
    // Segmented controls for each day that has 4 segment nil, or the 3 distinct shifts
    @IBOutlet weak var sundaySControl: UISegmentedControl!
    
    @IBOutlet weak var tuesdaySControl: UISegmentedControl!
    
    @IBOutlet weak var mondaySControl: UISegmentedControl!
    
    @IBOutlet weak var wednesdaySControl: UISegmentedControl!
    
    @IBOutlet weak var thursdaySControl: UISegmentedControl!
    
    @IBOutlet weak var fridaySControl: UISegmentedControl!
    
    @IBOutlet weak var saturdaySControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Put a title on the Navigation Bar
        self.navigationItem.title = "Add a Staff"
        // Put the title "Done' on the rightBarButtonItem
        self.navigationItem.rightBarButtonItem?.title = "Done"
       
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        // call the makeDayShiftAvailability function to collect a staff's available shifts
        makeDayShiftAvailability()
        
        if fNameTextField.text != "" && lNameTextField.text != "" && dayShiftAvailability != [] {
            print(dayShiftAvailability)
            // call the addStaff function to add a staff's information, first name, last name and shifts available
            let s = ModelClientStaffScheduler.sharedInstance.masterStaffList.addStaff(staffFirstName: fNameTextField.text!, staffLastName: lNameTextField.text!, staffShiftsAvailable: dayShiftAvailability, staffShiftsBooked: [:])
            
            ModelClientStaffScheduler.sharedInstance.masterScheduleList.addANewStaffSchedule(astaff: s, shifts: dayShiftAvailability)
            navigationController?.popViewController(animated: true)
        } else {
            // set up an alert if the user doesn't enter input for each area
            let alert = UIAlertController(title: "Enter first and last name.", message: "And at least one shift.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: { (action) in
                self.fNameTextField.text = ""
                self.lNameTextField.text = ""
                self.dayShiftAvailability = []
            }))
            present(alert, animated: true)
        }
    
    }
    
    
        // Set up a property which is an Array of shifts that a staff can work
        var dayShiftAvailability: [String] = []
    
        // This is a function to collect info from the segmented Control that appends the shifts that a staff member is available to work.
        func makeDayShiftAvailability() {
            // Append any Sunday shift the staff is available to work.
            switch sundaySControl.selectedSegmentIndex  {
            case 0:
                print("NOT AVAILABLE")
            case 1:
                dayShiftAvailability.append("SunA")
            case 2:
                dayShiftAvailability.append("SunB")
            default:
                dayShiftAvailability.append("SunC")
    
    
            }
            // Append any Monday shift the staff is available to work.
            switch mondaySControl.selectedSegmentIndex  {
            case 0:
                print("NOT AVAILABLE")
            case 1:
                dayShiftAvailability.append("MonA")
            case 2:
                dayShiftAvailability.append("MonB")
            default:
                dayShiftAvailability.append("MonC")
            }
            // Append any Tuesday shift the staff is available to work.
            switch tuesdaySControl.selectedSegmentIndex  {
            case 0:
                print("NOT AVAILABLE")
            case 1:
                dayShiftAvailability.append("TuesA")
            case 2:
                dayShiftAvailability.append("TuesB")
            default:
                dayShiftAvailability.append("TuesC")
            }
            // Append any Wednesday shift the staff is available to work.
            switch wednesdaySControl.selectedSegmentIndex  {
            case 0:
                print("NOT AVAILABLE")
            case 1:
                dayShiftAvailability.append("WedA")
            case 2:
                dayShiftAvailability.append("WedB")
            default:
                dayShiftAvailability.append("WedC")
            }
            // Append any Thursday shift the staff is available to work.
            switch thursdaySControl.selectedSegmentIndex  {
            case 0:
                print("NOT AVAILABLE")
            case 1:
                dayShiftAvailability.append("ThursA")
            case 2:
                dayShiftAvailability.append("ThursB")
            default:
                dayShiftAvailability.append("ThursC")
            }
            // Append any Friday shift the staff is available to work.
            switch fridaySControl.selectedSegmentIndex  {
            case 0:
                print("NOT AVAILABLE")
            case 1:
                dayShiftAvailability.append("FriA")
            case 2:
                dayShiftAvailability.append("FriB")
            default:
                dayShiftAvailability.append("FriC")
            }
            // Append any Saturday shift the staff is available to work.
            switch saturdaySControl.selectedSegmentIndex  {
            case 0:
                print("NOT AVAILABLE")
            case 1:
                dayShiftAvailability.append("SatA")
            case 2:
                dayShiftAvailability.append("SatB")
            default:
                dayShiftAvailability.append("SatC")
            }
        }
}

