//
//  AuthPersonalData.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/3/6.
//

import Foundation
import SwiftUI

//@EnvironmentObject var userAuthInfo: UserAuthInfo

// Transaction Definition
struct HttpAuthPersonalData: Codable, Hashable {
    var phone: String = ""
    var trueName: String = ""
    var displayName: String = ""
    var gender: String = ""
    var birthday: String = ""
    var identityNumber:  String = ""
    var mailingAddress: String = ""
    var emergencyContactName: String = ""
    var emergencyContactNumber: String = ""
    var emergencyContactRelationsip: String = ""
}

struct HttpAuthPersonalDataReply: Codable, Hashable {
    var result: String = ""
}

func httpAuthPersonalData(person: HttpAuthPersonalData, personCallback: @escaping (HttpAuthPersonalDataReply?, HttpError) -> ()) {
    let userAuthInfo = UserDefaults.standard
    
    print("Start for Auth Personal Data process...")
    
    let url = webURL + AUTH_PERSONAL_DATA
    var UrlRequest = URLRequest(url: URL(string: url)!)
    var errorContent = HttpError()

    guard let userToken = userAuthInfo.string(forKey: "userToken")
       // print("httpTestTrx get token ID from userAuthInfo: " + userToken)
    else {
        print("httpAuthPersonalData get token ID from userAuthInfo failed")
        errorContent.message = "Get User Token Failed!!"
        personCallback(nil, errorContent)
        return
    }

    print("httpAuthPersonalData get token ID from userAuthInfo: \(userToken)")

     do {
        let jsonSignupData = try JSONEncoder().encode(person)
        let jsonString = String(data: jsonSignupData, encoding: .utf8)!

        print("Personal Data JSON string: " + jsonString)

        UrlRequest.httpMethod = "PATCH"
        UrlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        UrlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        //UrlRequest.setValue("Bearer " + String(describing: userAuthInfo.object(forKey: "userToken")), forHTTPHeaderField: "Authorization")
         UrlRequest.setValue("Bearer " + userToken, forHTTPHeaderField: "Authorization")
        UrlRequest.httpBody = jsonSignupData
    }
    catch {
        print("httpAuthPersonalData JSON encode exception: " + error.localizedDescription)
        errorContent.message = "httpAuthPersonalData JSON encode exception: " + error.localizedDescription
        
        personCallback(nil, errorContent)
        return
    }
    
    let task = URLSession.shared.dataTask(with: UrlRequest) {(data, response, error) in
        if error != nil{
            print("httpAuthPersonalData Error: \(error?.localizedDescription ?? "Error")")
            
            errorContent.message = error!.localizedDescription
            personCallback(nil, errorContent)
            return
        }
        else {
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode)
            else {
                let errorResponse = response as? HTTPURLResponse
                let message: String = String(errorResponse!.statusCode) + " - " + HTTPURLResponse.localizedString(forStatusCode: errorResponse!.statusCode)
                print("httpAuthPersonalData Response message: " + message)
                
                ///Temp log
                //let outputStr  = String(data: data!, encoding: String.Encoding.utf8) as String?
                //let replyData = outputStr!.data(using: String.Encoding.utf8, allowLossyConversion: true)
                
                //let decoder = JSONDecoder()
                //let httpReply = try decoder.decode(HttpAuthSignupReply.self, from: replyData!)
                
                //print("HttpAuthSignupReply Error response body \(error?.localizedDescription))")
                ///Temp log
                errorContent.code = String(errorResponse!.statusCode)
                errorContent.message = HTTPURLResponse.localizedString(forStatusCode: errorResponse!.statusCode)
                personCallback(nil, errorContent)
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
            //do {
                /*
                let outputStr  = String(data: data!, encoding: String.Encoding.utf8) as String?
                let replyData = outputStr!.data(using: String.Encoding.utf8, allowLossyConversion: true)
                
                let decoder = JSONDecoder()
                let httpReply = try decoder.decode(HttpAuthLoginReply.self, from: replyData!)
                print("HttpAuthLoginReply json decoding seems OK ->" + outputStr!)
                */
                
                //No reply body, so just assign "OK" in reply struccture
                var httpReply: HttpAuthPersonalDataReply = HttpAuthPersonalDataReply()
                httpReply.result = "OK"
                personCallback(httpReply, errorContent)
            //}
            /*
            catch {
                print("HttpAuthPersonalDataReply JSON decode exception: " + error.localizedDescription)
                errorContent.message = "HttpAuthPersonalDataReply JSON decode exception: " + error.localizedDescription
                
                personCallback(nil, errorContent)
                return
            }*/
        }
    }
    task.resume()
    
    return
}
