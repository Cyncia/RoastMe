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
    
    @IBOutlet var Chart: UITableView!
    
    var users: [User] = []
    let roasts = ["There are 10 kinds of people in the world: those who understand binary, and those who don't.", "int elligence;", "Knock, knock. Race condition. Who’s there.", "%rip", "Two bytes meet. The first byte asks, “Are you ill?” The second byte replies, “No, just feeling a bit off."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        users = createArray()
        
        Chart.estimatedRowHeight = 100
        Chart.rowHeight = UITableViewAutomaticDimension
        
        Chart.delegate = self
        Chart.dataSource = self
    }

    // creating data and returning it as an array
    func createArray() -> [User] {
        var temp: [User] = []
        
        // can do UIImage: "name" I think... double check
        // player_Cell.ProfileIcon?.image = UIImage(named: player_Name)
        // let p0 = User(image: UIImage(named: Person1), name: "Person1")
        let p1 = User(image: #imageLiteral(resourceName: "Person1"), name: "Person1", roast: roasts[0])
        let p2 = User(image: #imageLiteral(resourceName: "Person2"), name: "Person2", roast: roasts[1])
        let p3 = User(image: #imageLiteral(resourceName: "Person3"), name: "Person3", roast: roasts[2])
        let p4 = User(image: #imageLiteral(resourceName: "Person4"), name: "Person4", roast: roasts[3])
        let p5 = User(image: #imageLiteral(resourceName: "Person5"), name: "Person5", roast: roasts[4])
        
        temp.append(p1)
        temp.append(p2)
        temp.append(p3)
        temp.append(p4)
        temp.append(p5)
        
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
        return users.count
    }
    
   // func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //    return 90
    //}
    
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
        let user_person = users[indexPath.row]
    
        let player_Cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        player_Cell.cellView.layer.borderWidth = 0.4
        player_Cell.cellView.layer.borderColor = UIColor.lightGray.cgColor
        // player_Cell.cellView.layer.cornerRadius = player_Cell.cellView.frame.height / 2.5
        
        
        player_Cell.setUser(person: user_person)
        
        /*
        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.blackColor().CGColor
         */
        
        // circle image
        player_Cell.ProfileIcon.layer.cornerRadius = player_Cell.ProfileIcon.frame.size.height / 2
        player_Cell.ProfileIcon.clipsToBounds = true
        //player_Cell.ProfileIcon.layer.cornerRadius = 55.0
        
        /*
        player_Cell.Name.text = users[indexPath.row]
        player_Cell.ProfileIcon.image = UIImage(named: users[indexPath.row])
        */
        return player_Cell
    }

}



