//
//  ProfileViewModel.swift
//  NewsApp
//
//  Created by son5c on 11/7/19.
//  Copyright © 2019 son5c. All rights reserved.
//

import Foundation


protocol ProfileContract {
    func validateInputs(_ userName: String, _ password: String) -> Bool
    func saveUser(_ userName: String, _ password: String)
    func isExisedUser(_ userName: String) -> Bool
}

class ProfileViewModel {}

extension ProfileViewModel: ProfileContract {
    //TODO: Validate input(Lenght/Rules of inputs)
    func validateInputs(_ userName: String, _ password: String) -> Bool {
        return true
    }
    
    func saveUser(_ userName: String, _ password: String) {
        LocalDatabase.storeUser(userName, password)
    }
    
    func isExisedUser(_ userName: String) -> Bool {
        return LocalDatabase.isExistedUser(userName)
    }
}
