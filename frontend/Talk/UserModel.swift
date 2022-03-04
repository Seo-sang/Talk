//
//  UserModel.swift
//  Talk
//
//  Created by 서상현 on 2022/02/26.
//

import Foundation

final class UserModel {
    struct User {
        var email : String
        var password : String
        var nickname : String   
    }
    
    //사용자 목록
    var users: [User] = [
        User(email: "tjtkdgus45@nate.com", password: "12345678", nickname: "seo"),
        User(email: "royseo98@gmail.com", password: "12345678", nickname : "sanghyeon")
    ]
    
    //아이디 형식 검사
    func isValidEmail(id: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format : "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: id)
    }
    
    //비밀번호 형식 검사
    func isValidPassword(pwd: String) -> Bool {
        let passwordRegEx = "^[a-zA-Z0-9]{8,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: pwd)
    }
}
