//
//  YourRoastsTableViewCell.swift
//  RoastMe
//
//  Created by Alexander Chen on 3/7/18.
//  Copyright © 2018 Cynthia Zhou. All rights reserved.
//

import UIKit

class YourRoastsTableViewCell: UITableViewCell {

    // Properties
    @IBOutlet var cellView: UIView!
    @IBOutlet var Roast: UITextView!
    
    
    func setText(roastText: String) {
        Roast.text = roastText
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
