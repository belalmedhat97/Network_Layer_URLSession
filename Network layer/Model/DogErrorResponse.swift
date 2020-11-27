//
//  DogErrorResponse.swift
//  Network layer
//
//  Created by Belal medhat on 11/27/20.
//  Copyright © 2020 Belal medhat. All rights reserved.
//

import Foundation
struct DogErrorResponse:Codable {

    var status:String?
    var message:String?
    var code:Int?
}
