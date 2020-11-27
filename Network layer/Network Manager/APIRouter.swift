//
//  APIRouter.swift
//  Network layer
//
//  Created by Belal medhat on 6/10/20.
//  Copyright © 2020 Belal medhat. All rights reserved.
//

import Foundation
enum DogAPIRouter: APIConfiguration {
  
    
    case DogImage // indicate Success Response
    case DogError // indicate Error Response
  
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .DogError:
            return .post
        case .DogImage:
            return .get
        }
    }
    
    // MARK: - Headers
    var Header: [String : String] {
          return ["":""]
      }
    
    
    
    // MARK: - Parameters
     var parameters: RequestParams {
        switch self {
        case .DogImage,.DogError:
            return.NoParamter // ## used One
        }
    }
    var baseURL: String {
        return "https://dog.ceo"
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .DogImage,.DogError:
            return "/api/breeds/image/random" // ## used One
        }
    }
    
    
}
