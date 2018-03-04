//
//  User.swift
//  RoastMe
//
//  Created by Cynthia Zhou on 3/3/18.
//  Copyright © 2018 Cynthia Zhou. All rights reserved.
//

import Foundation
import UIKit

class User {
    
    var image: UIImage
    var name: String
    var roast: String
    
    init(image: UIImage, name: String, roast: String) {
        self.image = image
        self.name = name
        self.roast = roast
    }
}
