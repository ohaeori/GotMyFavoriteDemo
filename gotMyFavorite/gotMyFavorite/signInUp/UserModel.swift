//
//  User.swift
//  myProjectPage
//
//  Created by qkrwoghk on 2020/06/03.
//  Copyright © 2020 COMP420. All rights reserved.
//

import Foundation

struct User {
    /******** properties********/
    var id: String
    var pwd: String
    var name: String
    var gender: String
    var mainTitle: String
    var subTitle: String
    var qList = [String]()
    var ansList = [String]()
    
    static var Users = [User]()
    
    /******** function********/
    static func addUser(id: String, pwd: String, name: String, gender: String){
        let newUser = User(id: id, pwd: pwd, name: name, gender: gender)
        Users.append(newUser)
    }
    
    static func isUser(id: String, pwd: String)->Bool{
        for user in Users {
           if user.id == id && user.pwd == pwd{
               return true
           }
        }
        return false
    }
    
    /******** initialization ********/
    init(){
        self.id = "";
        self.pwd = "";
        self.name = "";
        self.gender = "";
        self.mainTitle = "";
        self.subTitle = "";
    }
    
    init(id: String, pwd: String, name: String, gender: String){
        self.id = id;
        self.pwd = pwd;
        self.name = name;
        self.gender = gender;
        self.mainTitle = "";
        self.subTitle = "";
        self.qList = ["질문1", "질문2", "질문3", "질문4", "질문5", "질문6"];
        self.ansList = ["o", "o", "x", "o", "o", "x"];
    }
}


