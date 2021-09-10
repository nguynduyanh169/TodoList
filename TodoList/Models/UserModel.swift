//
//  UserModel.swift
//  TodoList
//
//  Created by Nguyễn Duy Anh on 10/09/2021.
//

import Foundation
struct UserModel {
    var uid: String
    var email: String?
    var displayName: String?
    
    init(uid: String, displayName: String?, email: String?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
}
