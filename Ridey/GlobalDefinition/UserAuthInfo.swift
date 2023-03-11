//
//  UserAuthInfo.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/3/6.
//

import Foundation
import SwiftUI
import Combine

final class UserAuthInfo: ObservableObject {
    
    init() {
        UserDefaults.standard.register(defaults: [
            "userId": "",
            "userToken": "",
            "email": "",
            "password": "",
            "phoneNumber": "",
            "memberSignupStatus": "",
            "driverApplyStatus": ""
        ])
    }
    
    @Published var userId: String = UserDefaults.standard.string(forKey: "userId") ?? "" {
        didSet {
            UserDefaults.standard.set(userId, forKey: "userId")
        }
    }

    @Published var userToken: String = UserDefaults.standard.string(forKey: "userToken") ?? "" {
        didSet {
            UserDefaults.standard.set(userToken, forKey: "userToken")
        }
    }

    @Published var email: String = UserDefaults.standard.string(forKey: "email") ?? "" {
        didSet {
            UserDefaults.standard.set(email, forKey: "email")
        }
    }

    @Published var password: String = UserDefaults.standard.string(forKey: "password") ?? "" {
        didSet {
            UserDefaults.standard.set(password, forKey: "password")
        }
    }

    @Published var phoneNumber: String = UserDefaults.standard.string(forKey: "phoneNumber") ?? "" {
        didSet {
            UserDefaults.standard.set(phoneNumber, forKey: "phoneNumber")
        }
    }

    @Published var memberSignupStatus: String = UserDefaults.standard.string(forKey: "memberSignupStatus") ?? "" {
        didSet {
            UserDefaults.standard.set(memberSignupStatus, forKey: "memberSignupStatus")
        }
    }

    @Published var driverApplyStatus: String = UserDefaults.standard.string(forKey: "driverApplyStatus") ?? "" {
        didSet {
            UserDefaults.standard.set(driverApplyStatus, forKey: "driverApplyStatus")
        }
    }

}
