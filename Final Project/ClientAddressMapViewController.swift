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


    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let location = mapView.centerCoordinate
        let message = "Lat= \(location.latitude)\nlong=\(location.longitude)"
        messageLabel.text = message
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Display the current client's address.
        clientAddressTextView.text = currentAddress
        
        var newSpan = theMapMapView.region.span
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
        
        var newSpan = theMapMapView.region.span
        if sender.currentTitle == "Zoom In" {
            newSpan.longitudeDelta /= 14.0
            newSpan.latitudeDelta /= 8.0
        } else {
            if( newSpan.latitudeDelta > -89 && newSpan.latitudeDelta < 89 && newSpan.longitudeDelta > -179 && newSpan.longitudeDelta < 179 ){
                newSpan.longitudeDelta *= 2.0
                newSpan.latitudeDelta *= 2.0
            } else {
                let zoomFactor = 400.0
                newSpan.longitudeDelta /= zoomFactor
                newSpan.latitudeDelta /= zoomFactor
                newSpan.longitudeDelta *= 2.0
                newSpan.latitudeDelta *= 2.0
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
