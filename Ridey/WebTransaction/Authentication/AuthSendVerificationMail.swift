//
//  AuthSendVerificationMail.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/3/7.
//
// Resend the verification email

import Foundation

// Transaction Definition
struct HttpAuthSendVerificationMail: Codable {
    var email: String = ""
}

struct HttpAuthSendVerificationMailReply: Codable {
    var result: String = ""
}

func httpAuthSendVerificationMail(sendMail: HttpAuthSendVerificationMail, sendMailCallback: @escaping (HttpAuthSendVerificationMailReply?, HttpError) -> ()) {
    let userAuthInfo = UserDefaults.standard
    
    print("Start for Sending Verification Mail process...")
    //var jsonData: Data?
    let url = webURL + AUTH_SEND_VERIFICATION_MAIL
    var UrlRequest = URLRequest(url: URL(string: url)!)
    var errorContent = HttpError()

    do {
        let jsonSignupData = try JSONEncoder().encode(sendMail)
        let jsonString = String(data: jsonSignupData, encoding: .utf8)!

        //print("httpAuthSendVerificationMail JSON string: " + jsonString)

        UrlRequest.httpMethod = "GET"
        UrlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        UrlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        UrlRequest.setValue("bearer " + String(describing: userAuthInfo.object(forKey: "userToken")), forHTTPHeaderField: "Authorization")
        //UrlRequest.httpBody = jsonSignupData
    }
    catch {
        print("httpAuthSendVerificationMail JSON encode exception: " + error.localizedDescription)
        errorContent.message = "httpAuthSendVerificationMail JSON encode exception: " + error.localizedDescription
        
        sendMailCallback(nil, errorContent)
        return
    }
    
    let task = URLSession.shared.dataTask(with: UrlRequest) {(data, response, error) in
        if error != nil{
            print("Auth Send Verification Mail Error: \(error?.localizedDescription ?? "Error")")
            
            errorContent.message = error!.localizedDescription
            sendMailCallback(nil, errorContent)
            return
        }
        else {
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode)
            else {
                let errorResponse = response as? HTTPURLResponse
                let message: String = String(errorResponse!.statusCode) + " - " + HTTPURLResponse.localizedString(forStatusCode: errorResponse!.statusCode)
                print("httpAuthSendVerificationMail Response message: " + message)

                errorContent.code = String(errorResponse!.statusCode)
                errorContent.message = HTTPURLResponse.localizedString(forStatusCode: errorResponse!.statusCode)
                sendMailCallback(nil, errorContent)
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
                var httpReply: HttpAuthSendVerificationMailReply = HttpAuthSendVerificationMailReply()
                httpReply.result = "OK" //String(describing: userAuthInfo.object(forKey: "email"))
                //print("HttpAuthSendVerificationMailReply json decoding seems OK ->" + outputStr!)
                sendMailCallback(httpReply, errorContent)
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
