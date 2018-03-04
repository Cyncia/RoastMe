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
    @IBOutlet weak var newPostButton: UIButton!
    
    let interactor = Interactor()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        helper()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newPostButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goToNewPost", sender: self)
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

