//
//  WebUtility.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/26.
//

import Foundation

let webURL: String = "https://backend.ridey.today/v1/"
let AUTH_SIGNUP = "auth/signup"
let AUTH_LOGIN = "auth/login"


extension URLSession {
    func dataTask(with url: URL, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: url) { (data, response, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let response = response, let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                result(.failure(error))
                return
            }
            result(.success((response, data)))
        }
    }
}

struct HttpError: Codable {
    var code: String = ""
    var message: String = ""
}
