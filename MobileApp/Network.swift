//
//  Network.swift
//  MobileApp
//
//  Created by Marketing Sharks on 15.04.2022.
//

import SwiftUI

class Network: ObservableObject{
    @Published var login: Login = Login(message: "", status: 0, token: "", email: "", expireAt: 0)
    @Published var leadinforequest: LeadInfoRequest = LeadInfoRequest(message: "", error:"", referrer_email: "", lead_status: 0)
    func getLogin(email: String, password_hash: String) {
        guard let url = URL(string: "https://app.leadfellow.dev/api/login") else { fatalError("Missing URL") }
        let body: [String: String] = ["email": email, "password_hash": password_hash]
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = finalBody
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedLogin = try JSONDecoder().decode(Login.self, from: data)
                        self.login = decodedLogin
                        print(self.login)
                        print("Selle kohal peaks olema data")
                        
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
    func sendLead(leadinfo: LeadInfo) {
        guard let url = URL(string: "https://app.leadfellow.dev/api/insert-lead") else {
            fatalError("Missing URL")
        }
        let body: [String: String] = ["token": leadinfo.token, "company": leadinfo.company, "person_first": leadinfo.person_first, "person_last": leadinfo.person_last, "phone": leadinfo.phone, "phone_area_code": leadinfo.phone_area_code, "email": leadinfo.email, "info": leadinfo.info, "commission": leadinfo.commission, "provider_emails": leadinfo.provider_emails.description]
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = finalBody
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        
                        let decodedResponse = try JSONDecoder().decode(LeadInfoRequest.self, from: data)
                        self.leadinforequest = decodedResponse
                        
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
}
