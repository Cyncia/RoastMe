//
//  TableViewController.swift
//  RoastMe
//
//  Created by Cynthia Zhou on 2/28/18.
//  Copyright © 2018 Cynthia Zhou. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var Name: UILabel!
    @IBOutlet var ProfileIcon: UIImageView!
    
}


class TableViewController: UITableViewController {

    let people = ["Person1", "Person2", "Person3", "Person4", "Person5"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        
        return 0
    }
/*
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
    
        
        return 0
    }
*/
    
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

}
 
