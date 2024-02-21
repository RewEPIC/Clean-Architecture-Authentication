//
//  UserToken.swift
//  Clean-Architecture
//
//  Created by Duangcharoen  on 14/2/2567 BE.
//

import Foundation

struct UserTokenResponse: Decodable {
    
    var token: String
    var refreshToken: String
}
