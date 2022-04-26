//
//  LeadInfoRequest.swift
//  MobileApp
//
//  Created by Marketing Sharks on 25.04.2022.
//

import Foundation
struct LeadInfoRequest: Decodable{
    var message: String
    var error: String
    var referrer_email: String
    var lead_status: Int
}
