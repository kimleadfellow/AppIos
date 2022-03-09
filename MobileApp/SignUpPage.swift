//
//  SignUpPage.swift
//  MobileApp
//
//  Created by Marketing Sharks on 23.01.2022.
//

import SwiftUI

struct SignUpText : View {
    var body: some View {
        return Text("Sign Up")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
            .foregroundColor(Color.white)
    }
}

struct FullnameTextField : View {
    
    @Binding var fullname: String
    
    @Binding var editingMode: Bool
    
    var body: some View {
        return TextField("Full name", text: $fullname, onEditingChanged: {edit in
            if edit == true
            {self.editingMode = true}
            else
            {self.editingMode = false}
        })
            .padding()
        .background(Color.white)
            .cornerRadius(5.0)
        .padding(.horizontal, 5.0)
        
    }
}

struct EmailTextField : View {
    
    @Binding var email: String
    
    @Binding var editingMode: Bool
    
    var body: some View {
        return TextField("E-mail", text: $email, onEditingChanged: {edit in
            if edit == true
            {self.editingMode = true}
            else
            {self.editingMode = false}
        })
            .padding()
        .background(Color.white)
            .cornerRadius(5.0)
        .padding(.horizontal, 5.0)
        
    }
}

struct SignUpPage : View {
    @State var username: String = ""
    @State var password: String = ""
    @State var email: String = ""
    @State var fullname: String = ""
    
    @State var editingMode: Bool = false
    @Binding var newUserCreated: Bool
    @Binding var signupYes: Bool
    
    @Binding var signInSuccess: Bool
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView{
        ZStack{
            Color(0x20ba9f).ignoresSafeArea()
            VStack{
            
                SignUpText()
                FullnameTextField(fullname: $fullname, editingMode: $editingMode)
                EmailTextField(email: $email, editingMode: $editingMode)
                UsernameTextField(username:$username, editingMode: $editingMode)
                PasswordSecureField(password: $password)
                Spacer()
                NavigationLink(destination: SignInPage( signupYes: $signupYes, signInSuccess: $signInSuccess, newUserCreated: $newUserCreated)){
                    Text("Sign Up").font(.headline)
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
        }.navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarHidden(false)
    }
}


struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        Group{
                SignUpPreviewContainer()
                }
    }
}

struct SignUpPreviewContainer : View{
    @State var signInSuccess = false
    @State var signupYes = false
    @State var newUserCreated = false
    var body: some View {
        SignUpPage(newUserCreated: $newUserCreated, signupYes: $signupYes, signInSuccess: $signInSuccess)
    }
}
