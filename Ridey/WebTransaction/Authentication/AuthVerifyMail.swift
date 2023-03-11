//
//  AuthVerifyMail.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/3/7.
//

import Foundation

// Transaction Definition
struct HttpAuthVerifyMail: Codable {
    var token: String = ""
}

struct HttpAuthVerifyMailReply: Codable {
    var result: String = ""
}

func httpAuthVerifyMail(verifyMail: HttpAuthVerifyMail, verifyMailCallback: @escaping (HttpAuthVerifyMailReply?, HttpError) -> ()) {
    //let userAuthInfo = UserDefaults.standard
    
    print("Start for Verify Mail process...")
    //var jsonData: Data?
    let url = webURL + AUTH_VERIFY_MAIL
    var UrlRequest = URLRequest(url: URL(string: url)!)
    var errorContent = HttpError()

    do {
        let jsonSignupData = try JSONEncoder().encode(verifyMail)
        let jsonString = String(data: jsonSignupData, encoding: .utf8)!

        print("httpAuthVerifyMail JSON string: " + jsonString)

        UrlRequest.httpMethod = "POST"
        UrlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        UrlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        //UrlRequest.setValue("bearer " + String(describing: userAuthInfo.object(forKey: "userToken")), forHTTPHeaderField: "Authorization")
        UrlRequest.httpBody = jsonSignupData
    }
    catch {
        print("httpAuthVerifyMail JSON encode exception: " + error.localizedDescription)
        errorContent.message = "httpAuthVerifyMail JSON encode exception: " + error.localizedDescription
        
        verifyMailCallback(nil, errorContent)
        return
    }
    
    let task = URLSession.shared.dataTask(with: UrlRequest) {(data, response, error) in
        if error != nil{
            print("Auth Verify Mail Error: \(error?.localizedDescription ?? "Error")")
            
            errorContent.message = error!.localizedDescription
            verifyMailCallback(nil, errorContent)
            return
        }
        else {
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode)
            else {
                let errorResponse = response as? HTTPURLResponse
                let message: String = String(errorResponse!.statusCode) + " - " + HTTPURLResponse.localizedString(forStatusCode: errorResponse!.statusCode)
                print("httpAuthVerifyMail Response message: " + message)

                errorContent.code = String(errorResponse!.statusCode)
                errorContent.message = HTTPURLResponse.localizedString(forStatusCode: errorResponse!.statusCode)
                verifyMailCallback(nil, errorContent)
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
                var httpReply: HttpAuthVerifyMailReply = HttpAuthVerifyMailReply()
                httpReply.result = "OK"
                //print("HttpAuthSendVerificationMailReply json decoding seems OK ->" + outputStr!)
                verifyMailCallback(httpReply, errorContent)
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
