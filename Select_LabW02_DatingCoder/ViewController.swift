//
//  ViewController.swift
//  Select_LabW02_DatingCoder
//
//  Created by admin on 27/06/16.
//  Copyright © 2016 koyot3. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    var people = [PersonLover]()
    var offset = 0
    var limit = 2
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let loadMoreButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        loadMoreButton.addTarget(self, action: #selector(loadMore), forControlEvents: .TouchUpInside)
        loadMoreButton.setTitle("Load more", forState: .Normal)
        loadMoreButton.backgroundColor = UIColor.blackColor()
        tableView.tableFooterView = loadMoreButton
        
        loadData()
    }
    
    func loadMore() {
        
        loadData()
    }
    
    func loadData() {
        Alamofire.request(.GET, "https://fancy-raptor.hyperdev.space/", parameters: ["offset": offset, "limit": limit])
            .responseJSON { [unowned self] response in
                
                guard let tempData = response.result.value else { print("nil roi"); return }
                
                let rawData = tempData as! [AnyObject]
                for data in rawData {
                    
                    let person = PersonLover(rawData: data)
//                    self.tableView.beginUpdates()
                    self.people.append(person)
//                    self.tableView.endUpdates()
                }
                
                self.offset += rawData.count
                self.tableView.reloadData()
        }

    }
}

