//
//  ClientAddressMapViewController.swift
//  Final Project
//
//  Created by Elizabeth Boswell on 12/1/18.
//  Copyright © 2018 Elizabeth Boswell. All rights reserved.
//

import UIKit
import MapKit

class ClientAddressMapViewController: UIViewController, MKMapViewDelegate {
    
    // from prepare for segue in ClientListTableViewController
    var currentClient : Client!
    
    
    @IBOutlet weak var clientAddressTextView: UITextView!
    @IBOutlet weak var theMapMapView: MKMapView!
    @IBOutlet weak var messageLabel: UILabel!
    
    var geocoder: CLGeocoder = CLGeocoder()
    // Prepare the current Client's address into a single String
    lazy var currentAddress = ("\(currentClient.clientStreet)" + "\n" + "\(currentClient.clientCity), ") + ("\(currentClient.clientState), ") + ("\(currentClient.clientZip)" )


//    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
//        let location = mapView.centerCoordinate
//        let message = "Lat= \(location.latitude)\nlong=\(location.longitude)"
//        messageLabel.text = message
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 1.5, delay: 0.0, options: [UIView.AnimationOptions.autoreverse, UIView.AnimationOptions.repeat], animations: {
            self.clientAddressTextView.backgroundColor = UIColor.green
        }, completion: nil)
    
        self.navigationItem.title = ("\(currentClient.clientFirstName)" + "'s Address")
        // Display the current client's address.
        clientAddressTextView.text = currentAddress
        // Set newSpan to the mapView's region and span
        var newSpan = theMapMapView.region.span
        // Zoom in a bunch so the user can see local cities
        let zoomFactor = 400.0
        newSpan.longitudeDelta /= zoomFactor
        newSpan.latitudeDelta /= zoomFactor
        
        theMapMapView.region.span  = newSpan
        geocoder.geocodeAddressString(currentAddress) { (placemarks, error) in
            if error != nil {
                self.messageLabel.text = "Error \(error!)"
            } else {
                let placemark = placemarks![0]
                let location = placemark.location!
                let coord = location.coordinate
                self.theMapMapView.centerCoordinate = coord
            }
        }
    }

    @IBAction func zoomRequestedTapped(_ sender: UIButton) {
        messageLabel.text = ""
        var newSpan = theMapMapView.region.span
        if sender.currentTitle == "Zoom In" {
            newSpan.longitudeDelta /= 14.0
            newSpan.latitudeDelta /= 8.0
        } else {
            // Check to make sure the user is not going to zoom out past the limits (and into the galaxy)
            if( newSpan.latitudeDelta > -89 && newSpan.latitudeDelta < 89 && newSpan.longitudeDelta > -179 && newSpan.longitudeDelta < 179 ){
                newSpan.longitudeDelta *= 2.0
                newSpan.latitudeDelta *= 2.0
            } else {
                messageLabel.text = "You can't zoom out any farther."
            }
        }
        theMapMapView.region.span  = newSpan
        geocoder.geocodeAddressString(currentAddress) { (placemarks, error) in
            if error != nil {
                self.messageLabel.text = "Error \(error!)"
            } else {
                let placemark = placemarks![0]
                let location = placemark.location!
                let coord = location.coordinate
                self.theMapMapView.centerCoordinate = coord
            }
        }
    }
}
