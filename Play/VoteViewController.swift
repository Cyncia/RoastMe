//
//  VoteViewController.swift
//  Play
//
//  Created by Cynthia Zhou on 2/6/18.
//  Copyright © 2018 Cynthia Zhou. All rights reserved.
//

import UIKit

class VoteViewController: UIViewController {

    var history = [String]()
    var curr = -1
    
    @IBOutlet var Roast1: UIView!
    @IBOutlet var Roast2: UIView!
    @IBOutlet var Roast3: UIView!
    @IBOutlet var Roast4: UIView!
    
    // define a variable to store initial touch position
    var initialTouchPoint: CGPoint = CGPoint(x: 0,y: 0)
    
    @IBAction func panGestureRecognizerHandler(_ sender: UIPanGestureRecognizer) {
        let touchPoint = sender.location(in: self.view?.window)
        
        if sender.state == UIGestureRecognizerState.began {
            initialTouchPoint = touchPoint
        } else if sender.state == UIGestureRecognizerState.changed {
            if touchPoint.y - initialTouchPoint.y > 0 {
                self.view.frame = CGRect(x: 0, y: touchPoint.y - initialTouchPoint.y, width: self.view.frame.size.width, height: self.view.frame.size.height)
            }
        } else if sender.state == UIGestureRecognizerState.ended || sender.state == UIGestureRecognizerState.cancelled {
            if touchPoint.y - initialTouchPoint.y > 100 {
                self.dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
                })
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Make buttons rounded
        Roast1.layer.cornerRadius = 15.0
        Roast1.clipsToBounds = true
        Roast2.layer.cornerRadius = 15.0
        Roast2.clipsToBounds = true
        Roast3.layer.cornerRadius = 15.0
        Roast3.clipsToBounds = true
        Roast4.layer.cornerRadius = 15.0
        Roast4.clipsToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func roastOneTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goToAllRoastsFromVote", sender: self)
    }
    @IBAction func roastTwoTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goToAllRoastsFromVote", sender: self)
    }
    @IBAction func roastThreeTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goToAllRoastsFromVote", sender: self)
    }
    @IBAction func roastFourTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goToAllRoastsFromVote", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAllRoastsFromVote" {
            if let destination = segue.destination as? AllRoastsViewController {
                destination.history = history
                destination.curr = curr
            }
        }
    }
    
}
