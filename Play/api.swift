//
//  api.swift
//  RoastMe
//
//  Created by Alexander Chen on 2/21/18.
//  Copyright © 2018 Cynthia Zhou. All rights reserved.
//
import Foundation
import Firebase

let rootRef = Database.database().reference()
let usersRef = rootRef.child("User")
let postsRef = rootRef.child("Post")
let roastsRef = rootRef.child("Roast")

func helper() {

}

/*********************************************
 ROASTS
 ********************************************/
func createRoast(postId: String, userId: String, text: String) -> String {
    //update roast table
    let roastId = roastsRef.childByAutoId().key
    let roast = ["userId": userId,
                 "postId": postId,
                 "voteCount": 0,
                 "text": text] as [String: Any]
    let updates = [roastId: roast]
    roastsRef.updateChildValues(updates)
    
    //update post table
    postsRef.child(postId).child("roasts").child(roastId).setValue(roastId)
    
    //update user table
    usersRef.child(userId).child("roasts").child(roastId).setValue(roastId)
    
    return roastId
}

func upvote(roastId: String) {
    let roastRef = roastsRef.child("\(roastId)")
    
    roastRef.observeSingleEvent(of: .value, with: { (snapshot) in
        let value = snapshot.value as? NSDictionary
        let voteCount = value?["voteCount"] as! Int
        
        //increment voteCount
        roastRef.child("voteCount").setValue(voteCount+1)
    }) { (error) in
        print(error.localizedDescription)
    }
}

func unUpvote(roastId: String) {
    let roastRef = roastsRef.child("\(roastId)")
    
    roastRef.observeSingleEvent(of: .value, with: { (snapshot) in
        let value = snapshot.value as? NSDictionary
        let voteCount = value?["voteCount"] as! Int
        
        //increment voteCount
        roastRef.child("voteCount").setValue(voteCount-1)
        
    }) { (error) in
        print(error.localizedDescription)
    }
}

func getRoastText(roastId: String, completion: @escaping (String) -> ()) {
    roastsRef.child(roastId).observeSingleEvent(of: .value, with: { (snapshot) in
        let value = snapshot.value as? NSDictionary
        
        let text = value?["text"] as? String ?? ""
        
        completion(text)
        
    }) { (error) in
        completion("")
        print(error.localizedDescription)
    }
}

func getPostFromRoast(roastId: String, completion: @escaping (String) -> ()) {
    roastsRef.child(roastId).observeSingleEvent(of: .value, with: { (snapshot) in
        let value = snapshot.value as? NSDictionary
        let postId = value?["postId"] as? String ?? ""
        
        completion(postId)
        
    }) { (error) in
        completion("")
        print(error.localizedDescription)
    }
}

func getUserFromRoast(roastId: String, completion: @escaping (String) -> ()) {
    roastsRef.child(roastId).observeSingleEvent(of: .value, with: { (snapshot) in
        let value = snapshot.value as? NSDictionary
        let userId = value?["userId"] as? String ?? ""
        
        completion(userId)
        
    }) { (error) in
        completion("")
        print(error.localizedDescription)
    }
}

/**********************************************
 POSTS
 *********************************************/
func createPost(userId: String, picURL: String) -> String {
    //update Post table
    let postId = postsRef.childByAutoId().key
    let post = ["userId": userId,
                "picURL": picURL]
    let updates = [postId: post]
    postsRef.updateChildValues(updates)
    
    //update User table
    usersRef.child(userId).child("posts").child(postId).setValue(picURL)
    
    return postId
}

func getRandomRoasts(postId: String, completion: @escaping ([String]) -> ()) {
    postsRef.child(postId).observeSingleEvent(of: .value, with: { (snapshot) in
        let value = snapshot.value as? NSDictionary
        let roastsDict = value?["roasts"] as? NSDictionary ?? NSDictionary()
        var roasts = roastsDict.allKeys as? [String] ?? [String]()
        var randomRoasts = [String]()
        
        for _ in 0..<5 {
            if roasts.count == 0 {
                break;
            }
            let rand = Int(arc4random_uniform(UInt32(roasts.count)))
            randomRoasts.append(roasts[rand])
            roasts.remove(at: rand)
        }
        
        completion(randomRoasts)
        
    }) { (error) in
        completion([String]())
        print(error.localizedDescription)
    }
}

func getAllRoasts(postId: String, completion: @escaping ([String]) -> ()) {
    postsRef.child(postId).observeSingleEvent(of: .value, with: { (snapshot) in
        let value = snapshot.value as? NSDictionary
        let roastsDict = value?["roasts"] as? NSDictionary ?? NSDictionary()
        
        let roasts = roastsDict.allKeys as? [String] ?? [String]()
        
        completion(roasts)
        
    }) { (error) in
        completion([String]())
        print(error.localizedDescription)
    }
}

func getNextPost(completion: @escaping (String) -> ()) {
    postsRef.observeSingleEvent(of: .value, with: { (snapshot) in
        let value = snapshot.value as? NSDictionary ?? NSDictionary()
        
        let posts = value.allKeys as? [String] ?? [String]()
        
        completion(posts[Int(arc4random_uniform(UInt32(posts.count)))])
        
    }) { (error) in
        completion("")
        print(error.localizedDescription)
    }
}

func getUserFromPost(postId: String, completion: @escaping (String) -> ()) {
    postsRef.child(postId).observeSingleEvent(of: .value, with: { (snapshot) in
        let value = snapshot.value as? NSDictionary
        let userId = value?["userId"] as? String ?? ""
        
        completion(userId)
        
    }) { (error) in
        print(error.localizedDescription)
    }
}

/*********************************************
 USERS
 ********************************************/
func createUser(email: String, password: String) -> String {
    let userId = usersRef.childByAutoId().key
    let user = ["email": email,
                "password": password]
    let updates = [userId: user]
    usersRef.updateChildValues(updates)
    
    return userId
}

func getUserInfo(userId: String, completion: @escaping (Bool, String, String) -> ()) {
    usersRef.child(userId).observeSingleEvent(of: .value, with: { (snapshot) in
        let value = snapshot.value as? NSDictionary
        
        let email = value?["email"] as! String
        let password = value?["password"] as! String

        completion(false, email, password)
        
    }) { (error) in
        completion(true, "", "")
        print(error.localizedDescription)
    }
}

func getYourRoasts(userId: String, completion: @escaping ([String]) -> ()) {
    usersRef.child(userId).observeSingleEvent(of: .value, with: { (snapshot) in
        let value = snapshot.value as? NSDictionary
        let roastsDict = value?["roasts"] as? NSDictionary ?? NSDictionary()
        
        let roasts = roastsDict.allKeys as? [String] ?? [String]()
        
        completion(roasts)
        
    }) { (error) in
        completion([String]())
        print(error.localizedDescription)
    }
}

func getYourPosts(userId: String, completion: @escaping ([String]) -> ()) {
    usersRef.child(userId).observeSingleEvent(of: .value, with: { (snapshot) in
        let value = snapshot.value as? NSDictionary
        let postsDict = value?["posts"] as? NSDictionary ?? NSDictionary()
        
        let posts = postsDict.allKeys as? [String] ?? [String]()
        
        completion(posts)
        
    }) { (error) in
        completion([String]())
        print(error.localizedDescription)
    }
}
