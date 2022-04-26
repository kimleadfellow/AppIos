//
//  LeadInfo.swift
//  MobileApp
//
//  Created by Marketing Sharks on 25.04.2022.
//

import Foundation

struct LeadInfo: Decodable{
    var token: String
    var company: String
    var person_first: String
    var person_last: String
    var phone: String
    var phone_area_code: String
    var email: String
    var info: String
    var commission: String
    var provider_emails: [String]
}
