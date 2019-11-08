//
//  LocalDatabase.swift
//  NewsApp
//
//  Created by son5c on 11/7/19.
//  Copyright © 2019 son5c. All rights reserved.
//

import Foundation
import KeychainAccess


struct LocalDatabase {
    static func getPasswordFromUserName(_ userName: String) -> String? {
        let keychain = Keychain(service: UserModelSettting.kKeychainServices)
        return keychain[userName]
    }
    
    static func isExistedUser(_ userName: String) -> Bool {
        if let users = UserDefaults.standard.value(forKey: UserModelSettting.kUserKey) as? [String] {
            let user = users.first(where: {$0 == userName})
            return user != nil
        }
        return false
    }
    
    static func storeUser(_ username: String, _ password: String) {
        LocalDatabase.storeUserName(username)
        LocalDatabase.storePassword(username, password)
    }
    
    private static func saveLocalData(_ data: Any, _ key: String) {
        UserDefaults.standard.setValue(data, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    private static func storeUserName(_ username: String) {
        if !LocalDatabase.isExistedUser(username) {
            if let users = UserDefaults.standard.value(forKey: UserModelSettting.kUserKey) as? [String] {
                var newUsers = users
                newUsers.append(username)
                LocalDatabase.saveLocalData(newUsers, UserModelSettting.kUserKey)
                return
            }
            LocalDatabase.saveLocalData([username], UserModelSettting.kUserKey)
        }
    }
    
    private static func storePassword(_ username: String, _ password: String) {
        let keychain = Keychain(service: UserModelSettting.kKeychainServices)
        keychain[username] = password
    }
}
