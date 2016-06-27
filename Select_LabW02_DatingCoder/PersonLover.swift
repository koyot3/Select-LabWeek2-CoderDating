//
//  PersonLover.swift
//  Select_LabW02_DatingCoder
//
//  Created by Ky Nguyen on 6/27/16.
//  Copyright © 2016 koyot3. All rights reserved.
//

import Foundation

struct PersonLover {
    
    var id: Int
    var name: String
//    var height: String
    var birthdate: String
    var avtarUrl: String
    
    init(rawData: AnyObject) {
        id = rawData.valueForKeyPath("id") as! Int
        name = rawData.valueForKeyPath("name") as! String
        
        birthdate = rawData.valueForKeyPath("birthdate") as! String
        avtarUrl = rawData.valueForKeyPath("picture") as! String
    }
    
}