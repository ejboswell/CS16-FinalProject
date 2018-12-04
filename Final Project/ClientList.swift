//
//  ClientList.swift
//  Final Project
//
//  Created by Elizabeth Boswell on 11/5/18.
//  Copyright © 2018 Elizabeth Boswell. All rights reserved.
//

import Foundation

class ClientList {
    
    // shared instance
//    static var shareInstance:ClientList = ClientList()

    var clients: [Client] = []
    
   
    // When called func addClient instantiates (makes) a new instance of Client.  It is called from the Model and also in the NewClientViewController when getting info from user.
    func addClient(clientFirstName: String, clientLastName: String, clientStreet: String, clientCity: String, clientState: String, clientZip: Int, hasCaregiver: [String:Staff?]) -> Client  {
        let c = Client(clientFirstName: clientFirstName, clientLastName: clientLastName, clientStreet: clientStreet, clientCity: clientCity,clientState: clientState, clientZip: clientZip, hasCaregiver: [:])
//            hasCaregiver)
        clients.append(c)
//        print(clients)
        return c
    }
    //  When called func getClient returns a single instance of Client from the array clients. It assists in filling in CellForRow at IndexPath and the prepare for segue in ClientListTableViewController
    func getClient(number:Int) -> Client {
        return clients[number]
    }
    

    // computed properties
    // This computed property returns the number of elements in the array clients. Used to set up the number of rows in the ClientListTableViewController.
    var numberOfClients: Int {
        return clients.count
    }
}
 
