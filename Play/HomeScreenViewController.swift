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
    
    var history = [String]()
    var curr = -1

    override func viewDidLoad() {
        super.viewDidLoad()
        getNextPost { (postId) in
            self.history.append(postId)
            self.curr += 1
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
        print("left swipe detected")
        if(curr + 1 == history.count) {
            getNextPost { (postId) in
                self.history.append(postId)
                self.curr += 1
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
        else {
            curr += 1
            let postId = history[curr]
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
    @IBAction func rightSwipe(_ sender: UISwipeGestureRecognizer) {
        print("right swipe detected")
        curr -= 1
        if(curr>=0) {
            let postId = history[curr]
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

