//
//  UserModel.swift
//  NewsApp
//
//  Created by son5c on 11/7/19.
//  Copyright © 2019 son5c. All rights reserved.
//

import Foundation

struct UserModelSettting {
    static let kKeychainServices = "com.newapps"
    static let kUserKey = "User"
    static let kUserNameKey = "UserName"
}

struct UserModel {
    private(set) var userName: String!
    
    func toJSON() -> Dictionary<String, String>{
        return [UserModelSettting.kUserNameKey: self.userName]
    }
}
