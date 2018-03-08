//
//  AllRoastsViewController.swift
//  RoastMe
//
//  Created by Cynthia Zhou on 3/3/18.
//  Copyright © 2018 Cynthia Zhou. All rights reserved.
//

import UIKit

class YourPostsViewController: UIViewController {
    
    var history = [String]()
    var curr = -1
    var postIds = [String]()
    var postURLs = [URL]()
    
    @IBOutlet var Chart: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        getYourPosts { (posts) in
            for post in posts {
                self.postIds.append(post)
                getPicURL(postId: post, completion: { (postURL) in
                    self.postURLs.append(postURL)
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
        if segue.identifier == "goToProfileFromYourPosts" {
            if let destination = segue.destination as? ParentVCViewController {
                destination.history = history
                destination.curr = curr
            }
        }
        else if segue.identifier == "goToHomeFromYourPosts" {
            if let destination = segue.destination as? ViewController {
                destination.history = history
                destination.curr = curr
            }
        }
    }
}

extension YourPostsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postURLs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        let url = postURLs[indexPath.row]
        
        let postCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! YourPostsTableViewCell
        
        if indexPath.row < postURLs.count {
            postCell.setImage(url: url)
        }
        
        return postCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("section: \(indexPath.section)")
        print("row: \(indexPath.row)")
        history.append(postIds[indexPath.row])
        curr += 1
        performSegue(withIdentifier: "goToHomeFromYourPosts", sender: self)
    }
    
}





