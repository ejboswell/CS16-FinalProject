//
//  ViewController.swift
//  Final Project
//
//  Created by Elizabeth Boswell on 11/4/18.
//  Copyright © 2018 Elizabeth Boswell. All rights reserved.
//

import UIKit

class StaffScheduleViewController: UIViewController {

    
    @IBOutlet weak var fNameTextField: UITextField!
    
    @IBOutlet weak var lNameTextField: UITextField!
    
    @IBOutlet weak var sundaySControl: UISegmentedControl!
    
    @IBOutlet weak var tuesdaySControl: UISegmentedControl!
    
    @IBOutlet weak var mondaySControl: UISegmentedControl!
    
    @IBOutlet weak var wednesdaySControl: UISegmentedControl!
    
    @IBOutlet weak var thursdaySControl: UISegmentedControl!
    
    @IBOutlet weak var fridaySControl: UISegmentedControl!
    
    @IBOutlet weak var saturdaySControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Add a Staff"
        self.navigationItem.rightBarButtonItem?.title = "Done"
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addStaffAndShiftsTapped(_ sender: UIButton) {
        
        if fNameTextField.text != "" && lNameTextField.text != "" {

            makeDayShiftAvailability()
            print(dayShiftAvailability)
        let s = ModelClientStaffScheduler.sharedInstance.masterStaffList.addStaff(staffFirstName: fNameTextField.text!, staffLastName: lNameTextField.text!, staffShiftsAvailable: dayShiftAvailability, staffShiftsBooked: [:])
            
            ModelClientStaffScheduler.sharedInstance.masterScheduleList.addANewStaffSchedule(astaff: s, shifts: dayShiftAvailability)
            performSegue(withIdentifier: "segueToStaffListTVController", sender: nil)
        }
    }
    

    
    
    
    
        var dayShiftAvailability: [String] = []
    
        func makeDayShiftAvailability() {
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

