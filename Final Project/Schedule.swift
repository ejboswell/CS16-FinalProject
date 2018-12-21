//
//  Schedule.swift
//  Final Project
//
//  Created by Elizabeth Boswell on 11/17/18.
//  Copyright © 2018 Elizabeth Boswell. All rights reserved.
//

import Foundation

class Schedule {
    // Schedule properties
    var aclient: Client?
    var astaff: Staff?
    var ashift: String
    
    init(aclient:Client?, astaff:Staff?, ashift:String) {
        self.aclient = aclient
        self.astaff = astaff
        self.ashift = ashift
    }
}
