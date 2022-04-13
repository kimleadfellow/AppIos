//
//  LeadInfo.swift
//  MobileApp
//
//  Created by Marketing Sharks on 09.03.2022.
//

import Foundation
class LeadInfo {
    var firstName: String
    var lastName: String
    var email: String
    var phone: String
    var company: String
    var info: String
    
    
    init(_ firstName: String,_ lastName: String,_ email: String,_ phone: String,_ company: String,_ info: String){
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phone = phone
        self.company = company
        self.info = info
    }
}
