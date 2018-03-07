//
//  AllRoastsViewController.swift
//  RoastMe
//
//  Created by Cynthia Zhou on 3/3/18.
//  Copyright © 2018 Cynthia Zhou. All rights reserved.
//

import UIKit

class AllRoastsViewController: UIViewController {

    var history = [String]()
    var curr = -1
    var roastTexts = [String]()
    
    @IBOutlet var Chart: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        getAllRoasts(postId: history[curr]) { (roasts) in
            print(roasts)
            for roast in roasts {
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
        if segue.identifier == "goToHomeFromAllRoasts" {
            if let destination = segue.destination as? ViewController {
                destination.history = history
                destination.curr = curr
            }
        }
    }

}

extension AllRoastsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roastTexts.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        let roast = roastTexts[indexPath.row]
    
        let roastCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        roastCell.cellView.layer.borderWidth = 0.4
        roastCell.cellView.layer.borderColor = UIColor.lightGray.cgColor
        // player_Cell.cellView.layer.cornerRadius = player_Cell.cellView.frame.height / 2.5
        
        
        roastCell.setText(roastText: roast)

        
        // circle image
        roastCell.ProfileIcon.layer.cornerRadius = roastCell.ProfileIcon.frame.size.height / 2
        roastCell.ProfileIcon.clipsToBounds = true

        return roastCell
    }

}



