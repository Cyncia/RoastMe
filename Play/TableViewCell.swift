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
    @IBOutlet var cellView: UIView!
    @IBOutlet var Roast: UITextView!
    
    
    func setText(roastText: String) {
        // person.image.layer.cornerRadius = person.image.frame.height / 2
        //ProfileIcon.image = person.image
        Roast.text = roastText
    }
    
    func setPic(picURL: URL) {
        do {
            let imgData = try Data(contentsOf: picURL)
            self.ProfileIcon.image = UIImage(data: imgData)
        } catch {
            print("Could not download image from URL.")
        }
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
