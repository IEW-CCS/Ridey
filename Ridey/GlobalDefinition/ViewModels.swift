//
//  ViewModels.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/3/6.
//

import Foundation

struct RegisterEMailVerificationViewModel: Hashable {
    var userId: String = ""
    var userToken: String = ""
    var email: String = ""
}

struct RegisterOTPVerificationViewModel: Hashable {
    var userId: String = ""
    var userToken: String = ""
}

struct RegisterMemberViewModel: Hashable  {
    var userId: String = ""
    var userToken: String = ""
    var phoneNumber: String = ""
}

struct RegisterCompleteViewModel: Hashable {
    var userId: String = ""
    var memberRegisterStatus: String = ""
}
