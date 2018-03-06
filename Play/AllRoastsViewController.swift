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
    var roastTexts = ["hello"]
    
    @IBOutlet var Chart: UITableView!
    
    var users: [User] = [User(image: #imageLiteral(resourceName: "Person1"), name: "name", roast: "hello")]
    let roasts = ["There are 10 kinds of people in the world: those who understand binary, and those who don't.", "int elligence;", "Knock, knock. Race condition. Who’s there.", "%rip", "Two bytes meet. The first byte asks, “Are you ill?” The second byte replies, “No, just feeling a bit off."]
    
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
        
        Chart.delegate = self
        Chart.dataSource = self
    }

    // creating data and returning it as an array
    func createArray() -> [User] {
        var temp: [User] = []
        
        for roastText in roastTexts {
            temp.append(User(image: #imageLiteral(resourceName: "Person1"), name: "hello", roast: roastText))
        }
        print(roastTexts)
        return temp
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
        print("users.count: ", users.count)
        return roastTexts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    /*
    // Change Selection Color
     
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedCell.contentView.backgroundColor = UIColor.red
    }
    
    // Just set it back in deselect
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cellToDeSelect:UITableViewCell = tableView.cellForRow(at: indexPath)!
        cellToDeSelect.contentView.backgroundColor = UIColor.clear
    }
    */
    
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



