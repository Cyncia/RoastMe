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
    let refHandle = postsRef.observe(DataEventType.value, with: { (snapshot) in
        let postDict = snapshot.value as? [String : AnyObject] ?? [:]
        print("postDict:", postDict)
    })
    print("refHandle", refHandle)
}

func getRandomRoasts(/*Post*/) {
    
}

func upvote(/*Roast*/) {
    
}

func unUpvote(roastID: Int) {
    //roastRef.child("\(roastID)").child("voteCount")
    
    
    
}

func getAllRoasts(/*Post*/) {
    
}

func sendRoast(/*Post*/) {
    
}

func getNextPost() {
    
}

func getPrevPost() {
    
}

func createPost() {
    
}

func getUserInfo() {
    
}

func getYourRoasts() {
    
}

func getYourPosts() {
    
}

func getPostFromRoast() {
    
}

func getUserFromRoast() {
    
}
