//
//  AuthDriverInfo.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/3/7.
//

import Foundation

struct HttpAuthDriverInfo: Codable, Hashable {
    var driverIntroduce: String = ""
    var driverExp: String = ""
    var driverPreference: String = ""
    var driverAcademicQualifications: String = ""
    var driverVaccination: String = ""
    var driverSmokingHabit:  String = ""
    var driverPetIntention: String = ""
}

struct HttpAuthDriverInfoReply: Codable, Hashable {
    var result: String = ""
}

func httpAuthDriverInfo(driverInfo: HttpAuthDriverInfo, driverInfoCallback: @escaping (HttpAuthDriverInfoReply?, HttpError) -> ()) {
    let userAuthInfo = UserDefaults.standard
    
    print("Start for Auth Driver Info process...")
    
    let url = webURL + AUTH_DRIVER_INFO
    var UrlRequest = URLRequest(url: URL(string: url)!)
    var errorContent = HttpError()

    guard let userToken = userAuthInfo.string(forKey: "userToken")
       // print("httpTestTrx get token ID from userAuthInfo: " + userToken)
    else {
        print("httpAuthDriverInfo get token ID from userAuthInfo failed")
        errorContent.message = "Get User Token Failed!!"
        driverInfoCallback(nil, errorContent)
        return
    }

    print("httpAuthDriverInfo get token ID from userAuthInfo: \(userToken)")

    do {
        let jsonSignupData = try JSONEncoder().encode(driverInfo)
        let jsonString = String(data: jsonSignupData, encoding: .utf8)!

        print("Dirver Info JSON string: " + jsonString)

        UrlRequest.httpMethod = "PATCH"
        UrlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        UrlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        //UrlRequest.setValue("bearer " + String(describing: userAuthInfo.object(forKey: "userToken")), forHTTPHeaderField: "Authorization")
         UrlRequest.setValue("Bearer " + userToken, forHTTPHeaderField: "Authorization")
        UrlRequest.httpBody = jsonSignupData
    }
    catch {
        print("httpAuthDriverInfo JSON encode exception: " + error.localizedDescription)
        errorContent.message = "httpAuthDriverInfo JSON encode exception: " + error.localizedDescription
        
        driverInfoCallback(nil, errorContent)
        return
    }
    
    let task = URLSession.shared.dataTask(with: UrlRequest) {(data, response, error) in
        if error != nil{
            print("httpAuthDriverInfo Error: \(error?.localizedDescription ?? "Error")")
            
            errorContent.message = error!.localizedDescription
            driverInfoCallback(nil, errorContent)
            return
        }
        else {
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode)
            else {
                let errorResponse = response as? HTTPURLResponse
                let message: String = String(errorResponse!.statusCode) + " - " + HTTPURLResponse.localizedString(forStatusCode: errorResponse!.statusCode)
                print("httpAuthDriverInfo Response message: " + message)
                
                ///Temp log
                //let outputStr  = String(data: data!, encoding: String.Encoding.utf8) as String?
                //let replyData = outputStr!.data(using: String.Encoding.utf8, allowLossyConversion: true)
                
                //let decoder = JSONDecoder()
                //let httpReply = try decoder.decode(HttpAuthSignupReply.self, from: replyData!)
                
                //print("HttpAuthSignupReply Error response body \(error?.localizedDescription))")
                ///Temp log
                errorContent.code = String(errorResponse!.statusCode)
                errorContent.message = HTTPURLResponse.localizedString(forStatusCode: errorResponse!.statusCode)
                driverInfoCallback(nil, errorContent)
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
                var httpReply: HttpAuthDriverInfoReply = HttpAuthDriverInfoReply()
                httpReply.result = "OK"
                driverInfoCallback(httpReply, errorContent)
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

