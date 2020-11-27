//
//  Constant.swift
//  Network layer
//
//  Created by Belal medhat on 6/10/20.
//  Copyright © 2020 Belal medhat. All rights reserved.
//

import Foundation
struct Endpoints {
static let baseURL = "https://dog.ceo"
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case string = "String"
    
}

enum ContentType: String {
    case json = "Application/json"
    case formEncode = "application/x-www-form-urlencoded"
}

enum RequestParams {
    case body(_:[String:Any])
    case url(_:[String:Any])
    case NoParamter
}
enum CustomResults<T,E,Error>{ // Using this custom results to decode when error json came  cause it has different reponse body different from success
    case success(T)
    case failure(E)
    case failureError(Error)
}
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
    // implement more when needed: post, put, delete, patch, etc.
}
