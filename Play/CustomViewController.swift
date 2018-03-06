//
//  Profile_SwipeMenu.swift
//  RoastMe
//
//  Created by Cynthia Zhou on 3/4/18.
//  Copyright © 2018 Cynthia Zhou. All rights reserved.
//

import UIKit
import SwipeMenuViewController

class CustomViewController: SwipeMenuViewController {
    /*
    @IBOutlet weak var swipeMenuView: SwipeMenuView!
    {
        didSet {
            swipeMenuView.delegate                        = self
            swipeMenuView.dataSource                      = self
            var options: SwipeMenuViewOptions             = .init()
            options.tabView.style                         = .segmented
            options.tabView.underlineView.backgroundColor = UIColor.red
            options.tabView.itemView.textColor            = UIColor.blue
            options.tabView.itemView.selectedTextColor    = UIColor.green
            swipeMenuView.reloadData(options: options)
        }
    }
    */
    
    // shoud change leaderboard to something else
    let tabs = ["Posts", "Roasts", "Other"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // swipeMenuView.layout
        
        swipeMenuView.delegate                        = self
        swipeMenuView.dataSource                      = self
        var options: SwipeMenuViewOptions             = .init()
        options.tabView.style                         = .segmented
        options.tabView.underlineView.backgroundColor = UIColor(red:192/255.0, green:57/255.0, blue:43/255.0, alpha:1.0)
        options.tabView.itemView.textColor            = UIColor.lightGray
        options.tabView.itemView.selectedTextColor    = UIColor(red:214/255.0, green:69/255.0, blue:65/255.0, alpha:1.0)
        
        // UIFont (name: "Futura Medium", size: 10)
        // for testing
        // options.tabView.backgroundColor = .red
        swipeMenuView.reloadData(options: options)
        
        /*
        ProfilePic.layer.borderWidth = 2
        ProfilePic.layer.masksToBounds = false
        ProfilePic.layer.borderColor = UIColor.white.cgColor
        ProfilePic.layer.cornerRadius = ProfilePic.frame.height/2
        ProfilePic.clipsToBounds = true
        */
        
        //swipeMenuView.dataSource = self
        //swipeMenuView.delegate = self
        //let options: SwipeMenuViewOptions = .init()
        //swipeMenuView.reloadData(options: options)
        
    }
//}

//extension CustomViewController {
    
    // MARK: - SwipeMenuViewDelegate
    /// Called before setup self.
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewWillSetupAt currentIndex: Int) {
        print("will setup SwipeMenuView")
        // Codes
    }
    
    /// Called after setup self.
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewDidSetupAt currentIndex: Int) {
        print("did setup SwipeMenuView")
        // Codes
    }
    
    // Called before swiping the page.
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, willChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        print("will change from section\(fromIndex + 1)  to section\(toIndex + 1)")
        // toIndex page
        
        // Codes
    }
    
    // Called after swiping the page.
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, didChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        print("did change from section\(fromIndex + 1)  to section\(toIndex + 1)")
        // Codes
    }
    
    
    // MARK - SwipeMenuViewDataSource
    // Return the number of pages in `SwipeMenuView`.
    override func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
        return tabs.count
    }
    
    // Return strings to be displayed at the specified tag in `SwipeMenuView`.
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
        return tabs[index]
    }
    
    // Return a ViewController to be displayed at the specified page in `SwipeMenuView`.
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> UIViewController {
        /*
        var vc: UIViewController
        
        if index == 0 {
            vc = PostsVC()
            print("VC: 0")
        }
        else if index == 1 {
            vc = RoastsVC()
            print("VC: 1")
        }
        // if index == 2
        else {
            vc = OtherVC()
            print("VC: 2")
        }
 */

        let vc = ContentViewController()
        vc.content = tabs[index]
        
        return vc
    }
}


/*
 // USE THIS IF YOU ARE USING UIVIEW & HAVING A SWIPEMENU VAR
extension CustomViewController: SwipeMenuViewDelegate {
    // MARK - SwipeMenuViewDelegate
    /// Called before setup self.
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewWillSetupAt currentIndex: Int) {
        // Codes
    }
    
    /// Called after setup self.
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewDidSetupAt currentIndex: Int) {
        // Codes
    }
    
    // Called before swiping the page.
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, willChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        // Codes
    }
    
    // Called after swiping the page.
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, didChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        // Codes
    }
}

extension CustomViewController: SwipeMenuViewDataSource {
    
    //MARK - SwipeMenuViewDataSource
    // Return the number of pages in `SwipeMenuView`.
    func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
        return tabs.count
    }
    
    // Return strings to be displayed at the specified tag in `SwipeMenuView`.
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
        return tabs[index]
    }
    
    // Return a ViewController to be displayed at the specified page in `SwipeMenuView`.
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> UIViewController {
        let vc = RoastViewController()
        return vc
    }
}
*/
