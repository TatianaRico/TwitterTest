//
//  Request.swift
//  TwitterTest
//
//  Created by Tatiana Rico on 24/09/21.
//  Copyright © 2021 Tatiana Rico. All rights reserved.
//

import Foundation
import Alamofire

class Request {
    let autorization: HTTPHeaders = HTTPHeaders(["Authorization" : "Bearer AAAAAAAAAAAAAAAAAAAAAObiTwEAAAAAjaIz%2FWJDuuwf2eVzVgp94XVR1O8%3DShWZ6FNJaxdT6Cu2Y6mkdtO1Ej0F0RteHsJyZPBKlMH3vOyRhb"])
    
    func requestUserTwitter(username: String, completion: @escaping (UserTwitter?, Bool) -> Void ) {
        AF.request("https://api.twitter.com/2/users/by/username/\(username)", method: .get, headers: autorization).responseJSON { (response) in
            if response.response?.statusCode == 200 {
                do {
                    if let data = response.data {
                        let json = try
                            JSONDecoder().decode(TwitterModel.self, from: data)
                        DispatchQueue.main.async {
                            completion(json.data, true)
                        }
                    }
                }
                catch {
                    completion(nil, false)
                }
            } else{
                completion(nil, false)
            }
        }
    }
    
    func requestIdTwitter(id: String, completion: @escaping (MsgIdTwitter?, Bool) -> Void ) {
        AF.request("https://api.twitter.com/2/users/\(id)/tweets", method: .get, headers: autorization).responseJSON { (response) in
            if response.response?.statusCode == 200 {
                do {
                    if let data = response.data {
                        let json = try
                            JSONDecoder().decode(MsgIdTwitter.self, from: data)
                          DispatchQueue.main.async {
                        completion(json, true)
                        }
                    }
                }
                catch {
                    completion(nil, false)
                }
            }
        }
    }
}



