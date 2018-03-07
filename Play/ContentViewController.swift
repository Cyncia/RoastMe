//
//  ContentViewController.swift
//  RoastMe
//
//  Created by Cynthia Zhou on 3/5/18.
//  Copyright © 2018 Cynthia Zhou. All rights reserved.
//

import UIKit

import Foundation

/********************************************
 VIEW CONTROLLER
 ********************************************/

class ContentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    /*
     var contentLabel: UILabel!{
     didSet {
     contentLabel.textColor = .black
     contentLabel.textAlignment = .center
     contentLabel.font = UIFont.boldSystemFont(ofSize: 25)
     contentLabel.text = content
     view.addSubview(contentLabel)
     
     contentLabel.translatesAutoresizingMaskIntoConstraints = false
     
     // constaints of text/label
     NSLayoutConstraint.activate([
     contentLabel.topAnchor.constraint(equalTo: self.view.topAnchor),
     contentLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor),
     contentLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
     contentLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
     ])
     }
     }
     */
    
    var content: String = ""
    // let myArray = ["First","Second","Third"]
    var myArray = [Any]()
    myArray =    [  ["content":"content1", "view":"1", "image":UIImage(named: imageLiteral(resourceName: "Person1"))],
    ["content":"content2", "view":"2", "image":UIImage(named: imageLiteral(resourceName: "Person5"))],
    ["content":"content3", "view":"3", "image":UIImage(named: imageLiteral(resourceName: "Person3"))]   ]
    
    var myTableView: UITableView!
    var profile_Roasts: [Profile_Roasts] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        // add data to array
        for data in myArray {
            var roast = Profile_Roasts(data: data)
            profile_Roasts.append(roast)
        }
        
        // Set Up TableView
        // myTableView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        // myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.register(Profile_RoastCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
        
        
        if content == "Posts" {
            print(content)
            // contentLabel = UILabel(frame: CGRect(x: 0, y: view.center.y - 50, width: view.frame.width, height: 50))
        }
            
        else if content == "Roasts" {
            print(content)
            //contentLabel = UILabel(frame: CGRect(x: 0, y: view.center.y - 50, width: view.frame.width, height: 50))
        }
            
        else if content == "Other" {
            print(content)
            //contentLabel = UILabel(frame: CGRect(x: 0, y: view.center.y - 50, width: view.frame.width, height: 50))
        }
            
        else {
            print("ERROR: content does not exist in ContentViewController")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(myArray[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profile_Roasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! TableViewCell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! Profile_RoastCell
        
        cell.contentText.text = myArray[indexPath.row]
        cell.votesLabel.text = "5"
        cell.corr_roast = UIImage(named: "Person1")!
        
        // cell.textLabel!.text = myArray[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
}

