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
    
    let tabs = ["Posts", "Roasts"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipeMenuView.delegate                        = self
        swipeMenuView.dataSource                      = self
        var options: SwipeMenuViewOptions             = .init()
        options.tabView.style                         = .segmented
        options.tabView.underlineView.backgroundColor = UIColor(red:192/255.0, green:57/255.0, blue:43/255.0, alpha:1.0)
        options.tabView.itemView.textColor            = UIColor.lightGray
        options.tabView.itemView.selectedTextColor    = UIColor(red:214/255.0, green:69/255.0, blue:65/255.0, alpha:1.0)
        
        swipeMenuView.reloadData(options: options)
        
    }

    /// Called before setup self.
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewWillSetupAt currentIndex: Int) {
        print("will setup SwipeMenuView")
    }
    
    /// Called after setup self.
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewDidSetupAt currentIndex: Int) {
        print("did setup SwipeMenuView")
    }
    
    // Called before swiping the page.
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, willChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        print("will change from section\(fromIndex + 1)  to section\(toIndex + 1)")
    }
    
    // Called after swiping the page.
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, didChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        print("did change from section\(fromIndex + 1)  to section\(toIndex + 1)")
    }
    
    override func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
        return tabs.count
    }
    
    // Return strings to be displayed at the specified tag in `SwipeMenuView`.
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
        return tabs[index]
    }
    
    // Return a ViewController to be displayed at the specified page in `SwipeMenuView`.
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> UIViewController {
        let vc = ContentViewController()
        vc.Chart.reloadData()
        return vc
    }
}
