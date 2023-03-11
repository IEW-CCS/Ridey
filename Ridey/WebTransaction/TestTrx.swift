//
//  TestTrx.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/3/6.
//

import Foundation

func httpTestTrx(test: String, testCallback: @escaping (HttpError) -> ()) {
    //@EnvironmentObject var userAuthInfo: UserAuthInfo
    let userAuthInfo = UserDefaults.standard
    
    print("Start for Testing process...")
    let url = webURL + AUTH_TEST
    var UrlRequest = URLRequest(url: URL(string: url)!)
    var errorContent = HttpError()

    //Testing log
    guard let userToken = userAuthInfo.string(forKey: "userToken")
       // print("httpTestTrx get token ID from userAuthInfo: " + userToken)
    else {
        print("httpTestTrx get token ID from userAuthInfo: failed")
        return testCallback(errorContent)
    }
    
    print("httpTestTrx get token ID from userAuthInfo: " + userToken)
    
    testCallback(errorContent)
    
    return
}
