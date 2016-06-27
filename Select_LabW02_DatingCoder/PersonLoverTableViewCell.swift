//
//  PersonLoverTableViewCell.swift
//  Select_LabW02_DatingCoder
//
//  Created by Ky Nguyen on 6/27/16.
//  Copyright © 2016 koyot3. All rights reserved.
//

import UIKit

class PersonLoverTableViewCell: UITableViewCell {

    @IBOutlet weak var picture: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func prepareForReuse() {
        
        picture.image = nil
    }
}
