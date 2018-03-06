//
//  ParentVCViewController.swift
//  RoastMe
//
//  Created by Cynthia Zhou on 3/5/18.
//  Copyright © 2018 Cynthia Zhou. All rights reserved.
//

import UIKit

class ParentVCViewController: UIViewController {
    
    var history = [String]()
    var curr = -1

    @IBOutlet var BkgdPic: UIImageView!
    @IBOutlet var ProfilePic: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        ProfilePic.layer.borderWidth = 2
        ProfilePic.layer.masksToBounds = false
        ProfilePic.layer.borderColor = UIColor.white.cgColor
        ProfilePic.layer.cornerRadius = ProfilePic.frame.height/2
        ProfilePic.clipsToBounds = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToHomeFromProfile" {
            if let destination = segue.destination as? ViewController {
                destination.history = history
                destination.curr = curr
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
