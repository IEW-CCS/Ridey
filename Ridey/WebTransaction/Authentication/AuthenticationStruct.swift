//
//  AuthenticationStruct.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/26.
//

import Foundation

struct HttpAuthSignup: Codable {
    var email: String = ""
    var password: String = ""
}

struct HttpAuthSignupReply: Codable {
    var userid: String = ""
    var token: String = ""
}

