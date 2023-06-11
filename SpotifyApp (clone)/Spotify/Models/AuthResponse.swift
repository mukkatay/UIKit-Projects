//
//  AuthResponse.swift
//  Spotify
//
//  Created by Akyl Mukatay  on 27.05.2023.
//

import UIKit

struct AuthResponse: Codable {
    let access_token: String
    let expires_in: Int
    let refresh_token: String
    let scope: String
    let token_type: String
}
