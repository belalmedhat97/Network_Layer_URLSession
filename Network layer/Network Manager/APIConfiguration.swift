//
//  APIConfiguration.swift
//  Network layer
//
//  Created by Belal medhat on 6/10/20.
//  Copyright © 2020 Belal medhat. All rights reserved.
//

import Foundation

protocol APIConfiguration {
    var baseURL: String { get }
    var path: String { get }
    var parameters: RequestParams { get }
    var method: HTTPMethod { get }
    var Header:[String:String] { get }
}
// MARK: - cofigure urlRequest with url and all components body ,header ,method etc...

extension APIConfiguration {
public var urlRequest: URLRequest {
    guard let url = URL(string: baseURL) else {
    fatalError("URL could not be built")
    }
    var request = URLRequest(url: url.appendingPathComponent(path))
    
    
    request.httpMethod = method.rawValue
    request.allHTTPHeaderFields = Header

    switch parameters {

            case .body(let params):
                request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])

               case .url(let params):
                       let queryParams = params.map { pair  in
                           return URLQueryItem(name: pair.key, value: "\(pair.value)")
                       }
                       var components = URLComponents(string:url.appendingPathComponent(path).absoluteString)
                       components?.queryItems = queryParams
                       request.url = components?.url

               case .NoParamter:
                   request.httpBody = nil

               }

                return request
    }
}

