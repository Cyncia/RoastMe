//
//  Profile_RoastCell.swift
//  RoastMe
//
//  Created by Cynthia Zhou on 3/6/18.
//  Copyright © 2018 Cynthia Zhou. All rights reserved.
//

import UIKit

// hold content, like text of label should be etc.
class Profile_Roasts {
    var corr_roastpic: UIImage?
    var content: String?
    // var votes: Int?
    var votes: String?
    var background_color: UIColor?
    
    init(data: [String: Any])
    {
        if let a = data["content"] as? String {
            content = a
        }
        if let b = data["votes"] as? String {
            votes = b
        }
        if let c = data["image"] as? UIImage {
            corr_roastpic = c
        }
        
    }
    /*
     A few declarations for UIImage:
     var imageA1: UIImage? = nil
     var imageA2: UIImage!
     var imageA3: UIImage = UIImage()
     var imageA4: UIImage? = UIImage()
     var imageA5: UIImage = UIImage(named: "redQuestionMark")!
     var imageA6: UIImage? = UIImage(named: "redQuestionMark")
     */
}


/********************************************
 TABLE VIEW CELL
 ********************************************/
// define properties of cells, like have labels, etc.
class Profile_RoastCell: UITableViewCell {
    
    let padding: CGFloat = 5
    var background: UIView!
    // var content: String?
    // var contentLabel: UILabel!
    // remember to disable scrolling and edits
    var corr_roast: UIImage = UIImage()
    var contentText: UITextView!
    var votesLabel: UILabel!
    var fire: UIImage = UIImage(named: "fire")!
    
    var profile_roasts: Profile_Roasts? {
        didSet {
            if let s = profile_roasts {
                contentText.text = s.content
                votesLabel.text = s.votes
                // votesLabel.text = String(describing: s.votes) // initialize a new string and pass int as argument
                // votes.text = "\(s.count)"    // get warning
                // how to extract the images? --> array check all raosts
                corr_roast = s.corr_roastpic!
                background.backgroundColor = s.background_color
                setNeedsLayout()
            }
        }
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // backgroundColor = UIColor.clear
        backgroundColor = UIColor.red
        selectionStyle = .none
        
        background = UIView(frame: CGRect.zero)
        background.alpha = 0.6
        contentView.addSubview(background)
        
        // contentText = UILabel(frame: CGRectZero)
        contentText.textAlignment = .left
        contentText.textColor = UIColor.purple
        contentText.font = UIFont(name: "Futura", size: 12.0)
        contentText.addSubview(contentText)
        
        votesLabel = UILabel(frame: CGRect.zero)
        votesLabel.textAlignment = .right
        votesLabel.textColor = UIColor.green
        votesLabel.font = UIFont(name: "Futura", size: 12.0)
        contentView.addSubview(votesLabel)
        
        // !!! set dimentions for UIImage
        // corr_roast = UIImage(frame: CGRect.zero), set size of image to 100x100
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // position items
        background.frame = CGRect(origin: CGPoint(x: 0, y: padding), size: CGSize(width: frame.width, height: frame.height - 2 * padding))
        votesLabel.frame = CGRect(origin: CGPoint(x: frame.width - 100, y: padding), size: CGSize(width: 100, height: frame.height - 2 * padding))
        contentText.frame = CGRect(origin: CGPoint(x: 100, y: 0), size: CGSize(width: frame.width - votesLabel.frame.width, height: frame.height))
        
    }
}


