//
//  AuthenticationAPI.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/26.
//

import Foundation
import SwiftUI

func httpAuthSignUp(signup: HttpAuthSignup, signUpCallback: @escaping (HttpAuthSignupReply?) -> ()) {
    print("Start for User Signup process...")
    //var jsonData: Data?
    let url = webURL + AUTH_SIGNUP
    var UrlRequest = URLRequest(url: URL(string: url)!)

    do {
        let jsonSignupData = try JSONEncoder().encode(signup)
        let jsonString = String(data: jsonSignupData, encoding: .utf8)!

        print("Signup JSON string: " + jsonString)

        UrlRequest.httpMethod = "POST"
        UrlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        UrlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        //UrlRequest.setValue("bearer " + codeContent.strTokenID, forHTTPHeaderField: "Authorization")
        UrlRequest.httpBody = jsonSignupData
    }
    catch {
        print("httpAuthSignUp JSON encode exception: " + error.localizedDescription)
        signUpCallback(nil)
        return
    }
    
    let task = URLSession.shared.dataTask(with: UrlRequest) {(data, response, error) in
        if error != nil{
            print("Auth Signup Error: \(error?.localizedDescription ?? "Error")")
            signUpCallback(nil)
            return
        }
        else {
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode)
            else {
                let errorResponse = response as? HTTPURLResponse
                let message: String = String(errorResponse!.statusCode) + " - " + HTTPURLResponse.localizedString(forStatusCode: errorResponse!.statusCode)
                print("HttpAuthSignup Response message: " + message)
                signUpCallback(nil)
                return
            }
            /*
            .tryMap({ data -> LoginResponse in
                let decoder = JSONDecoder()
                guard let loginResponse = try? decoder.decode(LoginResponse.self, from: data) else {
                    throw try decoder.decode(ErrorResponse.self, from: data)
                }
                return loginResponse
            })
            */
            do {
                let outputStr  = String(data: data!, encoding: String.Encoding.utf8) as String?
                let replyData = outputStr!.data(using: String.Encoding.utf8, allowLossyConversion: true)
                
                let decoder = JSONDecoder()
                let httpReply = try decoder.decode(HttpAuthSignupReply.self, from: replyData!)
                
                print("HttpAuthSignupReply json decoding seems OK!!")
                signUpCallback(httpReply)
            }
            catch {
                print("HttpAuthSignUpReply JSON decode exception: " + error.localizedDescription)
                signUpCallback(nil)
                return
            }
        }
    }
    task.resume()
    
    return
}

func httpAuthLoginn() {
    
}

func httpAuthSendVerificationEMail() {
    
}

func httpAuthVerifyEmail() {
    
}

func httpAuthSendVerificationSMS() {
    
}
