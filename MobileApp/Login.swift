//
//  Login.swift
//  MobileApp
//
//  Created by Marketing Sharks on 15.04.2022.
//

import Foundation

struct Login: Decodable{
    let message: String
    let status: Int
    let token: String
    let email: String
    let expireAt: Int
    }
