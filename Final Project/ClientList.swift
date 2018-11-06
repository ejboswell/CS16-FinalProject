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
    
   
    
    func addClient(clientFirstName: String, clientLastName: String)  {
        let c = Client(clientFirstName: clientFirstName, clientLastName: clientLastName)
        clients.append(c)
        print(clients)
    }
    
    func getClient(number:Int) -> Client {
        return clients[number]
    }
    

    // computed properties
    var numberOfClients: Int {
        return clients.count
    }
    
}
 
