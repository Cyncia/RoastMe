//
//  AllRoastsViewController.swift
//  RoastMe
//
//  Created by Cynthia Zhou on 3/3/18.
//  Copyright © 2018 Cynthia Zhou. All rights reserved.
//

import UIKit

class YourRoastsViewController: UIViewController {
    
    var history = [String]()
    var curr = -1
    var roastIds = [String]()
    var roastTexts = [String]()
    
    @IBOutlet var Chart: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        getYourRoasts { (roasts) in
            print(roasts)
            for roast in roasts {
                self.roastIds.append(roast)
                getRoastText(roastId: roast, completion: { (roastText) in
                    self.roastTexts.append(roastText)
                    self.Chart.reloadData()
                })
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Chart.estimatedRowHeight = 100
        Chart.rowHeight = UITableViewAutomaticDimension
        
        Chart.delegate = self
        Chart.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToProfileFromYourRoasts" {
            if let destination = segue.destination as? ParentVCViewController {
                destination.history = history
                destination.curr = curr
            }
        }
        else if segue.identifier == "goToAllRoastsFromYourRoasts" {
            if let destination = segue.destination as? AllRoastsViewController {
                destination.history = history
                destination.curr = curr
            }
        }
    }
    
}

extension YourRoastsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roastTexts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        let roast = roastTexts[indexPath.row]
        
        let roastCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! YourRoastsTableViewCell
        
        roastCell.cellView.layer.borderWidth = 0.4
        roastCell.cellView.layer.borderColor = UIColor.lightGray.cgColor
        // player_Cell.cellView.layer.cornerRadius = player_Cell.cellView.frame.height / 2.5
        
        if indexPath.row < roastTexts.count {
            roastCell.setText(roastText: roast)
        }
        
        return roastCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("section: \(indexPath.section)")
        print("row: \(indexPath.row)")
        getPostFromRoast(roastId: roastIds[indexPath.row]) { (postId) in
            self.history.append(postId)
            self.curr += 1
            self.performSegue(withIdentifier: "goToAllRoastsFromYourRoasts", sender: self)
        }
    }
    
}




