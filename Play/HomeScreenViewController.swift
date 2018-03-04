//
//  ViewController.swift
//  Play
//
//  Created by Cynthia Zhou on 2/5/18.
//  Copyright © 2018 Cynthia Zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var top_bar: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    let interactor = Interactor()

    override func viewDidLoad() {
        super.viewDidLoad()
        getNextPost { (postId) in
            getPicURL(postId: postId, completion: { (url) in
                do {
                    let imgData = try Data(contentsOf: url)
                    self.imageView.image = UIImage(data: imgData)
                } catch {
                    print("Could not download image from URL.")
                }
            })
        }
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func leftSwipe(_ sender: UISwipeGestureRecognizer) {
        getNextPost { (postId) in
            getPicURL(postId: postId, completion: { (url) in
                do {
                    let imgData = try Data(contentsOf: url)
                    self.imageView.image = UIImage(data: imgData)
                } catch {
                    print("Could not download image from URL.")
                }
            })
        }
    }
    
}


extension ViewController: UIViewControllerTransitioningDelegate {
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimator()
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
}

