//
//  VoteViewController.swift
//  Play
//
//  Created by Cynthia Zhou on 2/6/18.
//  Copyright © 2018 Cynthia Zhou. All rights reserved.
//

import UIKit

class VoteViewController: UIViewController {

 
    @IBOutlet var Roast1: UIView!
    @IBOutlet var Roast2: UIView!
    @IBOutlet var Roast3: UIView!
    @IBOutlet var Roast4: UIView!
    @IBOutlet var Roast5: UIView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Roast1.layer.cornerRadius = 10.0
        Roast1.clipsToBounds = true
        Roast2.layer.cornerRadius = 10.0
        Roast2.clipsToBounds = true
        Roast3.layer.cornerRadius = 10.0
        Roast3.clipsToBounds = true
        Roast4.layer.cornerRadius = 10.0
        Roast4.clipsToBounds = true
        Roast5.layer.cornerRadius = 10.0
        Roast5.clipsToBounds = true
        
        
        // self.layer.borderWidth = 10
        // self.layer.borderColor = UIColor.white.cgColor

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
