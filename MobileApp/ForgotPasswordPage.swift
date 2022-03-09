//
//  ForgotPasswordPage.swift
//  MobileApp
//
//  Created by Marketing Sharks on 23.01.2022.
//

import SwiftUI

struct ForgotPasswordText : View {
    var body : some View {
        return Text("Forgot password?").font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
            .foregroundColor(Color.white)
    }
}

struct ForgotPasswordPage : View{
    @State var password: String = ""
    @Binding var newUserCreated: Bool
    @Binding var signupYes: Bool
    @Binding var signInSuccess: Bool
    @State var email: String = ""
    @State var editingMode: Bool = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(0x20ba9f).ignoresSafeArea()
                VStack{
                    ForgotPasswordText()
                    Spacer()
                    EmailTextField(email: $email, editingMode: $editingMode)
                    Spacer()
                    NavigationLink(destination: SignInPage( signupYes: $signupYes, signInSuccess: $signInSuccess, newUserCreated: $newUserCreated)){
                        Text("Submit").font(.headline)
                            //change
                            .foregroundColor(Color(0x20ba9f))
                            .padding()
                            .frame(width: 300, height: 60)
                            .background(Color.white)
                            .cornerRadius(5.0)
                            .onTapGesture {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                    }
                    Spacer()
                }
            }
        }
    }
}

struct ForgotPasswordPage_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ForgotPasswordPreviewContainer()
        }
    }
}

struct ForgotPasswordPreviewContainer : View{
    @State var signInSuccess = false
    @State var signupYes = false
    @State var newUserCreated = false
    var body: some View {
        ForgotPasswordPage(newUserCreated: $newUserCreated, signupYes: $signupYes, signInSuccess: $signInSuccess)
    }
}
