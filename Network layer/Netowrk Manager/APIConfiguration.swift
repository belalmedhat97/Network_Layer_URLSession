//
//  APIConfiguration.swift
//  Network layer
//
//  Created by Belal medhat on 6/10/20.
//  Copyright © 2020 Belal medhat. All rights reserved.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: RequestParams { get }
}
