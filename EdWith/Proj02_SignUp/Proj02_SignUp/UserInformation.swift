//
//  UserInformation.swift
//  Proj02_SignUp
//
//  Created by KimSuyoung on 2018. 5. 1..
//  Copyright © 2018년 KimSuyoung. All rights reserved.
//

import Foundation

class UserInfomation {
    static let shared: UserInfomation = UserInfomation()
    
    var name: String?
    var age: String?
}
