//
//  TokenResponse.swift
//  ThreenitasDemoIOS
//
//  Created by George Servos  on 2/8/21.
//

import Foundation

struct TokenResponse : Codable {
    
    var tokenType : String
    var accessToken : String
    var refreshToken : String
    var expiresIn: Int
    
    enum CodingKeys : String, CodingKey {
        case expiresIn = "expires_in"
        case tokenType = "token_type"
        case refreshToken = "refresh_token"
        case accessToken = "access_token"
    }
    
}
