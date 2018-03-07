//
//  ContentViewController.swift
//  RoastMe
//
//  Created by Cynthia Zhou on 3/5/18.
//  Copyright © 2018 Cynthia Zhou. All rights reserved.
//

import UIKit

import UIKit

class ContentViewController: UIViewController {
    
    var roastTexts = ["hello"]
    
    var Chart: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        self.Chart = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        self.Chart.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        
        self.Chart.estimatedRowHeight = 100
        self.Chart.rowHeight = UITableViewAutomaticDimension
        
        self.Chart.delegate = self
        self.Chart.dataSource = self
        
        self.view.addSubview(Chart)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ContentViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roastTexts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        let roast = roastTexts[indexPath.row]
        
        let roastCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        roastCell.cellView.layer.borderWidth = 0.4
        roastCell.cellView.layer.borderColor = UIColor.lightGray.cgColor
        
        
        roastCell.setText(roastText: roast)
        
        
        // circle image
        roastCell.ProfileIcon.layer.cornerRadius = roastCell.ProfileIcon.frame.size.height / 2
        roastCell.ProfileIcon.clipsToBounds = true
        
        return roastCell
    }
    
}






//class ContentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//
//    private let myArray: NSArray = ["First","Second","Third"]
//    private var myTableView: UITableView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
//        let displayWidth: CGFloat = self.view.frame.width
//        let displayHeight: CGFloat = self.view.frame.height
//
//        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
//        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
//        myTableView.dataSource = self
//        myTableView.delegate = self
//        self.view.addSubview(myTableView)
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Num: \(indexPath.row)")
//        print("Value: \(myArray[indexPath.row])")
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return myArray.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
//        cell.textLabel!.text = "\(myArray[indexPath.row])"
//        return cell
//    }
//}
//
