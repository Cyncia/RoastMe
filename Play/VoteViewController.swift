//
//  VoteViewController.swift
//  Play
//
//  Created by Cynthia Zhou on 2/6/18.
//  Copyright © 2018 Cynthia Zhou. All rights reserved.
//

import UIKit

class VoteViewController: UIViewController {
    
    @IBOutlet weak var roast1: UIButton!
    @IBOutlet weak var roast2: UIButton!
    @IBOutlet weak var roast3: UIButton!
    @IBOutlet weak var roast4: UIButton!
    var roastOneId: String = ""
    var roastTwoId: String = ""
    var roastThreeId: String = ""
    var roastFourId: String = ""
    
    
    var history = [String]()
    var curr = -1
    
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
        roast1.layer.cornerRadius = 15.0
        roast1.clipsToBounds = true
        roast2.layer.cornerRadius = 15.0
        roast2.clipsToBounds = true
        roast3.layer.cornerRadius = 15.0
        roast3.clipsToBounds = true
        roast4.layer.cornerRadius = 15.0
        roast4.clipsToBounds = true
        
        getRandomRoasts(postId: history[curr]) { (roasts) in
            if roasts.count > 0 {
                self.roastOneId = roasts[0]
                getRoastText(roastId: roasts[0], completion: { (roast) in
                    self.roast1.setTitle(roast, for: .normal)
                })
            }
            if roasts.count > 1 {
                self.roastTwoId = roasts[1]
                getRoastText(roastId: roasts[1], completion: { (roast) in
                    self.roast2.setTitle(roast, for: .normal)
                })
            }
            if roasts.count > 2 {
                self.roastThreeId = roasts[2]
                getRoastText(roastId: roasts[2], completion: { (roast) in
                    self.roast3.setTitle(roast, for: .normal)
                })
            }
            if roasts.count > 3 {
                self.roastFourId = roasts[3]
                getRoastText(roastId: roasts[3], completion: { (roast) in
                    self.roast4.setTitle(roast, for: .normal)
                })
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func roastOneTapped(_ sender: UIButton) {
        upvote(roastId: roastOneId)
        performSegue(withIdentifier: "goToAllRoastsFromVote", sender: self)
    }
    @IBAction func roastTwoTapped(_ sender: UIButton) {
        upvote(roastId: roastTwoId)
        performSegue(withIdentifier: "goToAllRoastsFromVote", sender: self)
    }
    @IBAction func roastThreeTapped(_ sender: UIButton) {
        upvote(roastId: roastThreeId)
        performSegue(withIdentifier: "goToAllRoastsFromVote", sender: self)
    }
    @IBAction func roastFourTapped(_ sender: UIButton) {
        upvote(roastId: roastFourId)
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
