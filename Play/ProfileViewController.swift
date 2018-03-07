//
//  ProfileViewController.swift
//  RoastMe
//
//  Created by Cynthia Zhou on 2/21/18.
//  Copyright © 2018 Cynthia Zhou. All rights reserved.
//

import UIKit
// import SwipeMenuViewController

class ProfileViewController: UIViewController {

    var history = [String]()
    var curr = -1
    
    @IBOutlet var ProfilePic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ProfilePic.layer.cornerRadius = ProfilePic.frame.size.height / 2
        ProfilePic.clipsToBounds = true
/*
        swipeMenuView.dataSource = self
        swipeMenuView.delegate = self
        
        let options: SwipeMenuViewOptions = .init()
        
        swipeMenuView.reloadData(options: options)
 */
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
        else if segue.identifier == "goToYourRoastsFromProfile" {
            if let destination = segue.destination as? YourRoastsViewController {
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
