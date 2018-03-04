//
//  TableViewController.swift
//  RoastMe
//
//  Created by Cynthia Zhou on 2/28/18.
//  Copyright © 2018 Cynthia Zhou. All rights reserved.
//
/*
import UIKit

class TableViewController: UITableViewController {

    let people = ["Person1", "Person2", "Person3", "Person4", "Person5"]
    
    var users: [User] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        users = createArray()
        
        
        /*
         ProfileIcon.layer.borderWidth = 1
         ProfileIcon.layer.masksToBounds = false
         ProfileIcon.layer.borderColor = UIColor.blackColor().CGColor
         ProfileIcon.layer.cornerRadius = image.frame.height/2
         ProfileIcon.clipsToBounds = true
         */

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    // creating data and returning it as an array
    func createArray() -> [User] {
        var temp: [User] = []
        
        // can do UIImage: "name" I think... double check
        let p1 = User(image: #imageLiteral(resourceName: "Person1"), title: "Person1")
        let p2 = User(image: #imageLiteral(resourceName: "Person2"), title: "Person2")
        let p3 = User(image: #imageLiteral(resourceName: "Person3"), title: "Person3")
        let p4 = User(image: #imageLiteral(resourceName: "Person4"), title: "Person4")
        let p5 = User(image: #imageLiteral(resourceName: "Person5"), title: "Person5")
        
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        
        return 1
    }


    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        let player_Cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        let player_Name = people[indexPath.row]
        player_Cell.Name?.text = player_Name
        player_Cell.ProfileIcon?.image = UIImage(named: player_Name)
        
        return player_Cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    private func loadUsers() {
        let photo1 = UIImage(named: "Person1")
        let photo2 = UIImage(named: "Person2")
        let photo3 = UIImage(named: "Person3")
        let photo4 = UIImage(named: "Person4")
        let photo5 = UIImage(named: "Person5")
        
        guard let p1 = Meal(name: "Caprese Salad", photo: photo1, rating: 4) else {
            fatalError("Unable to instantiate meal1")
        }
        
        
        users += [p1, p2, p3, p4, p5]
        
    }
}

extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    
    
}
*/
