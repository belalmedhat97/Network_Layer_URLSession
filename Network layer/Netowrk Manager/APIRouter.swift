//
//  APIRouter.swift
//  Network layer
//
//  Created by Belal medhat on 6/10/20.
//  Copyright © 2020 Belal medhat. All rights reserved.
//

import Foundation
import Alamofire
enum APIRouter: APIConfiguration {
    
    case login(username:String, password:String)
    case getUserDetails
    case DogImage
  
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .getUserDetails,.DogImage:
            return .get
        }
    }
    // MARK: - Parameters
     var parameters: RequestParams {
        switch self {
        case .login(let username, let password):
            return .body(["username":username,"password":password]) // for example not used
        case .getUserDetails:
            return.body([:])    // for example not used
        case .DogImage:
            return.NoParamter // ## used One
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .login:
            return "/loginEndpoint" // for example not used
        case .getUserDetails:
            return "/userDetailEndpoint" // for example not used
        case .DogImage:
            return "/api/breeds/image/random" // ## used One
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Endpoints.baseURL.asURL()
       
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
    
        // HTTP Method
        urlRequest.httpMethod = method.rawValue


        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
     

        
        // Parameters
        switch parameters {
            
        case .body(let params):
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
         
            
        case .url(let params):
                let queryParams = params.map { pair  in
                    return URLQueryItem(name: pair.key, value: "\(pair.value)")
                }
                var components = URLComponents(string:url.appendingPathComponent(path).absoluteString)
                components?.queryItems = queryParams
                urlRequest.url = components?.url
         
        case .NoParamter:
            urlRequest.httpBody = nil
        
        }
            return urlRequest
    }
}
