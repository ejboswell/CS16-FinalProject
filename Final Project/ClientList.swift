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
    
   
    // When called func addClient instantiates (makes) a new instance of Client
    func addClient(clientFirstName: String, clientLastName: String, hasCaregiver: [String:Staff?])  {
        let c = Client(clientFirstName: clientFirstName, clientLastName: clientLastName, hasCaregiver: [:])
//            hasCaregiver)
        clients.append(c)
        print(clients)
    }
    //  When called func getClient returns a single instance of Client from the array clients.
    func getClient(number:Int) -> Client {
        return clients[number]
    }
    

    // computed properties
    // This computed property returns the number of elements in the array clients
    var numberOfClients: Int {
        return clients.count
    }
    
}
 
