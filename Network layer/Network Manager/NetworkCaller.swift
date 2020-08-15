//
//  NetworkCaller.swift
//  Network layer
//
//  Created by Belal medhat on 8/15/20.
//  Copyright © 2020 Belal medhat. All rights reserved.
//

import Foundation
import Alamofire
class NetworkCaller{
    class func Request<T:Codable>(_ url:APIConfiguration,completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(url).responseData(completionHandler: {response in
           switch response.result{
           case .success(let RequestResponse):
               if let code = response.response?.statusCode{
                   switch code {
                   case 200...299:
                       do {
                           completion(.success(try JSONDecoder().decode(T.self, from: RequestResponse)))
                       } catch let error {
                           print(String(data: RequestResponse, encoding: .utf8) ?? "nothing received")
                        completion(.failure(error))
                       }
                   default:
                    let error = NSError(domain: response.debugDescription, code: code, userInfo:        response.response?.allHeaderFields as? [String: Any])
                    completion(.failure(error))
                   }
               }
           case .failure(let error):
            completion(.failure(error))
        }
       })
   }
}

