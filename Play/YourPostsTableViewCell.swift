//
//  YourRoastsTableViewCell.swift
//  RoastMe
//
//  Created by Alexander Chen on 3/7/18.
//  Copyright © 2018 Cynthia Zhou. All rights reserved.
//

import UIKit

class YourPostsTableViewCell: UITableViewCell {
    
    // Properties
    @IBOutlet var cellView: UIView!
    @IBOutlet weak var postImage: UIImageView!

    func setImage(url: URL) {
        do {
            let imgData = try Data(contentsOf: url)
            self.postImage.image = UIImage(data: imgData)
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

