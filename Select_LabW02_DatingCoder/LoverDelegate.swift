//
//  LoverDelegate.swift
//  Select_LabW02_DatingCoder
//
//  Created by Ky Nguyen on 6/27/16.
//  Copyright © 2016 koyot3. All rights reserved.
//

import UIKit
import Alamofire

extension ViewController : UITableViewDelegate {
    
    
}

extension ViewController : UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        print("load cell")
        let person = people[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("PersonLoverTableViewCell", forIndexPath: indexPath) as! PersonLoverTableViewCell
        cell.nameLabel.text = person.name
        
        Alamofire.request(.GET, person.avtarUrl)
            .responseJSON { response in
                
                cell.picture.image = UIImage(data: response.data!)
                
        }
        
        return cell
    }
}