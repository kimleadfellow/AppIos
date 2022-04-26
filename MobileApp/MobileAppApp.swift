//
//  MobileAppApp.swift
//  MobileApp
//
//  Created by Marketing Sharks on 23.01.2022.
//

import SwiftUI

@main
struct MobileAppApp: App {
    @State var signInSuccess = false
    @State var signupYes = false
    @State var newUserCreated = false
    var network = Network()
    var body: some Scene {
        WindowGroup {
            SignInPage(signupYes: $signupYes, signInSuccess: $signInSuccess, newUserCreated: $newUserCreated).environmentObject(network)
        }
    }
}
