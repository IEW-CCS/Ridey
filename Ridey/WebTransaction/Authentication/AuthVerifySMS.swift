//
//  AuthVerifySMS.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/3/7.
//

import Foundation

// Transaction Definition
struct HttpAuthVerifySMS: Codable {
    var token: String = "" //OTP code
}

struct HttpAuthVerifySMSReply: Codable {
    var result: String = ""
}

func httpAuthVerifySMS(verifySMS: HttpAuthVerifySMS, verifySMSCallback: @escaping (HttpAuthVerifySMSReply?, HttpError) -> ()) {
    let userAuthInfo = UserDefaults.standard
    
    print("Start for Verify OTP Code process...")
    //var jsonData: Data?
    let url = webURL + AUTH_VERIFY_SMS
    var UrlRequest = URLRequest(url: URL(string: url)!)
    var errorContent = HttpError()

    guard let userToken = userAuthInfo.string(forKey: "userToken")
       // print("httpTestTrx get token ID from userAuthInfo: " + userToken)
    else {
        print("httpAuthVerifySMS get token ID from userAuthInfo failed")
        errorContent.message = "Get User Token Failed!!"
        verifySMSCallback(nil, errorContent)
        return
    }

    print("httpAuthVerifySMS get token ID from userAuthInfo: \(userToken)")

    do {
        let jsonSignupData = try JSONEncoder().encode(verifySMS)
        let jsonString = String(data: jsonSignupData, encoding: .utf8)!

        print("httpAuthVerifySMS JSON string: " + jsonString)

        UrlRequest.httpMethod = "POST"
        UrlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        UrlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        UrlRequest.setValue("Bearer " + userToken, forHTTPHeaderField: "Authorization")
        UrlRequest.httpBody = jsonSignupData
    }
    catch {
        print("httpAuthVerifySMS JSON encode exception: " + error.localizedDescription)
        errorContent.message = "httpAuthVerifySMS JSON encode exception: " + error.localizedDescription
        
        verifySMSCallback(nil, errorContent)
        return
    }
    
    let task = URLSession.shared.dataTask(with: UrlRequest) {(data, response, error) in
        if error != nil{
            print("Auth Verify OTP Code Error: \(error?.localizedDescription ?? "Error")")
            
            errorContent.message = error!.localizedDescription
            verifySMSCallback(nil, errorContent)
            return
        }
        else {
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode)
            else {
                let errorResponse = response as? HTTPURLResponse
                let message: String = String(errorResponse!.statusCode) + " - " + HTTPURLResponse.localizedString(forStatusCode: errorResponse!.statusCode)
                print("httpAuthVerifySMS Response message: " + message)

                errorContent.code = String(errorResponse!.statusCode)
                errorContent.message = HTTPURLResponse.localizedString(forStatusCode: errorResponse!.statusCode)
                verifySMSCallback(nil, errorContent)
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
                //let outputStr  = String(data: data!, encoding: String.Encoding.utf8) as String?
                //let replyData = outputStr!.data(using: String.Encoding.utf8, allowLossyConversion: true)
                
                //let decoder = JSONDecoder()
                //let httpReply = try decoder.decode(HttpAuthSendVerificationMailReply.self, from: replyData!)
                var httpReply: HttpAuthVerifySMSReply = HttpAuthVerifySMSReply()
                httpReply.result = "OK"
                //print("HttpAuthSendVerificationMailReply json decoding seems OK ->" + outputStr!)
                verifySMSCallback(httpReply, errorContent)
            //}
            //catch {
            //    print("HttpAuthLoginReply JSON decode exception: " + error.localizedDescription)
            //    errorContent.message = "HttpAuthLoginReply JSON decode exception: " + error.localizedDescription
                
            //    loginCallback(nil, errorContent)
            //    return
            //}
        }
    }
    task.resume()
    
    return
}
