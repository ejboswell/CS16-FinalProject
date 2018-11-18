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
// Collect the segmented control index from each segmented control
//            let sunSCIndex = sundaySControl.selectedSegmentIndex
//            let monSCIndex = mondaySControl.selectedSegmentIndex
//            let tuesSCIndex = tuesdaySControl.selectedSegmentIndex
//            let wedSCIndex = wednesdaySControl.selectedSegmentIndex
//            let thursSCIndex = thursdaySControl.selectedSegmentIndex
//            let friSCIndex = fridaySControl.selectedSegmentIndex
//            let satSCIndex = saturdaySControl.selectedSegmentIndex
            makeDayShiftAvailability()
            print(dayShiftAvailability)
            ModelClientStaffScheduler.sharedInstance.masterStaffList.addStaff(staffFirstName: fNameTextField.text!, staffLastName: lNameTextField.text!, staffShiftsAvailable: dayShiftAvailability, staffShiftsBooked: [:])
        }
    }
    
//
//    var dayShiftAvailability: [String:String] = [:]
//
//    func makeDayShiftAvailability() {
//        switch sundaySControl.selectedSegmentIndex  {
//        case 0:
//            print("NOT AVAILABLE")
//        case 1:
//            dayShiftAvailability["SunA"] = "available"
//        case 2:
//            dayShiftAvailability["SunB"] = "available"
//        default:
//            dayShiftAvailability["SunC"] = "available"
//
//
//        }
//        switch mondaySControl.selectedSegmentIndex  {
//        case 0:
//            print("NOT AVAILABLE")
//        case 1:
//            dayShiftAvailability["MonA"] = "available"
//        case 2:
//            dayShiftAvailability["MonB"] = "available"
//        default:
//            dayShiftAvailability["MonC"] = "available"
//        }
//        switch tuesdaySControl.selectedSegmentIndex  {
//        case 0:
//            print("NOT AVAILABLE")
//        case 1:
//            dayShiftAvailability["TuesA"] = "available"
//        case 2:
//            dayShiftAvailability["TuesB"] = "available"
//        default:
//            dayShiftAvailability["TuesC"] = "available"
//        }
//        switch wednesdaySControl.selectedSegmentIndex  {
//        case 0:
//            print("NOT AVAILABLE")
//        case 1:
//            dayShiftAvailability["WedA"] = "available"
//        case 2:
//            dayShiftAvailability["WedB"] = "available"
//        default:
//            dayShiftAvailability["WedC"] = "available"
//        }
//        switch thursdaySControl.selectedSegmentIndex  {
//        case 0:
//            print("NOT AVAILABLE")
//        case 1:
//            dayShiftAvailability["ThursA"] = "available"
//        case 2:
//            dayShiftAvailability["ThursB"] = "available"
//        default:
//            dayShiftAvailability["ThursC"] = "available"
//        }
//        switch fridaySControl.selectedSegmentIndex  {
//        case 0:
//            print("NOT AVAILABLE")
//        case 1:
//            dayShiftAvailability["FriA"] = "available"
//        case 2:
//            dayShiftAvailability["FriB"] = "available"
//        default:
//            dayShiftAvailability["FriC"] = "available"
//        }
//        switch saturdaySControl.selectedSegmentIndex  {
//        case 0:
//            print("NOT AVAILABLE")
//        case 1:
//            dayShiftAvailability["SatA"] = "available"
//        case 2:
//            dayShiftAvailability["SatB"] = "available"
//        default:
//            dayShiftAvailability["SatC"] = "available"
//        }
//    }
    
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

