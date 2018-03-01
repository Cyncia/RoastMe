//
//  ViewController.swift
//  Play
//
//  Created by Cynthia Zhou on 2/5/18.
//  Copyright © 2018 Cynthia Zhou. All rights reserved.
//

import UIKit



extension UIView {
    
    /*
    func applyGradient(colours: [UIColor]) -> Void {
        self.applyGradient(colours: colours, locations: nil)
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }
    */
    /*
    // change so you can add colors directly
    func applyGradient() {
        
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
    //  gradient.colors = [UIColor(red:0.72, green:0.06, blue:0.04, alpha:1.0).cgColor, UIColor(red:0.79, green:0.20, blue:0.20, alpha:1.0).cgColor, UIColor(red:0.98, green:0.50, blue:0.45, alpha:1.0).cgColor, UIColor.clear.cgColor]
        gradient.colors = [UIColor.darkGray.cgColor, UIColor.lightGray.cgColor, UIColor.clear.cgColor]
        gradient.locations = [0.3, 0.6, 0.8]
        self.layer.addSublayer(gradient)
        
    }
    */
 
}



class ViewController: UIViewController {

    @IBOutlet var top_bar: UIView!
    
    let interactor = Interactor()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // self.top_bar.applyGradient(colours: [UIColor.darkGray, UIColor.lightGray])
        // self.view.applyGradient(colours: [UIColor.yellow, UIColor.blue, UIColor.red], locations: [0.0, 0.5, 1.0])
        
       // self.top_bar.applyGradient()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        helper()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

/*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? VoteViewController {
            destinationViewController.transitioningDelegate = self
            destinationViewController.interactor = interactor
        }
    }
*/

}


extension ViewController: UIViewControllerTransitioningDelegate {
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimator()
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
}

