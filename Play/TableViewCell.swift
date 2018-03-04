//
//  TableViewCell.swift
//  RoastMe
//
//  Created by Cynthia Zhou on 3/3/18.
//  Copyright © 2018 Cynthia Zhou. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    // Properties
    @IBOutlet var ProfileIcon: UIImageView!
    @IBOutlet var Name: UILabel!
    @IBOutlet var cellView: UIView!
    @IBOutlet var Roast: UITextView!
    
    
    func setUser(person: User) {
        // person.image.layer.cornerRadius = person.image.frame.height / 2
        ProfileIcon.image = person.image
        Name.text = person.name
        Roast.text = person.roast
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}