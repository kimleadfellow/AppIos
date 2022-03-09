//
//  SignInPage.swift
//  MobileApp
//
//  Created by Marketing Sharks on 23.01.2022.
//

import SwiftUI


struct SignInText : View {
    var body: some View {
        return Text("Sign In")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
            .foregroundColor(Color.white)
    }
}

struct UserImage : View {
    var body: some View {
        return Image("mobileuiimg")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 25)
    }
}

struct UsernameTextField : View {
    
    @Binding var username: String
    
    @Binding var editingMode: Bool
    
    var body: some View {
        return TextField("Username", text: $username, onEditingChanged: {edit in
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

struct PasswordSecureField : View {
    
    @Binding var password: String
    
    var body: some View {
        return SecureField("Password", text: $password)
            .padding()
            .background(Color.white)
            .cornerRadius(5.0)
            .padding(.horizontal, 5.0)
            
            
    }
}

var LoginAccount = LeadfellowAccount("", "")



struct SignInPage : View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var ingredientNames = [""]
    
    @State var username: String = ""
    @State var password: String = ""
    @State private var action: Int? = 0

    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
    
    @State var editingMode: Bool = false
    
    @State var isPresented: Bool = false
    
    @Binding var signupYes: Bool
    
    @Binding var signInSuccess: Bool
    
    @Binding var newUserCreated: Bool
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView{
        ZStack {
            Color(0x20ba9f).ignoresSafeArea()
            VStack{
                Spacer()
                Spacer()
                UserImage()
                SignInText()
                UsernameTextField(username: $username, editingMode: $editingMode)
                PasswordSecureField(password: $password)
                if authenticationDidFail {
                    Text("Information not correct. Try again.")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
                HStack{
                    NavigationLink(destination: ForgotPasswordPage(newUserCreated: $newUserCreated, signupYes: $signupYes, signInSuccess: $signInSuccess)){
                        Text("Forgot password?").font(.system(size: 10, weight: .bold, design: .default))
                            //change
                            .foregroundColor(.white)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                            .padding()
                            .frame(width: 150.0, height: 20)
                        .background(Color(0x20ba9f))
                            .cornerRadius(15.0)
                    }
                    Spacer()
                }
                Spacer()
                VStack{
                    NavigationLink(destination: AddProvidersPage(newUserCreated: $newUserCreated, signupYes: $signupYes, signInSuccess: $signInSuccess,editingMode: $editingMode, firstName: $firstName, lastName: $lastName ),tag: 2, selection: $action){
                        Text("Sign in").font(.headline)
                            //change
                            .foregroundColor(Color(0x20ba9f))
                            .padding()
                            .frame(width: 300, height: 60)
                            .background(Color.white)
                            .cornerRadius(5.0)
                            .onTapGesture {
                                self.presentationMode.wrappedValue.dismiss()
                                self.action=2
                            }
                    }.disabled(false) //LISADA API ET KONTROLLIDA SISSELOGIMINE
                    
                    Spacer()
                    NavigationLink(destination: SignUpPage(newUserCreated: $newUserCreated, signupYes: $signupYes, signInSuccess: $signInSuccess), tag: 1, selection: $action){
                        Text("Sign Up").onTapGesture {
                            self.action=1
                        }
                        .font(.system(size: 10, weight: .bold, design: .default))
                        //change
                        .foregroundColor(.white)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .padding()
                        .frame(width: 150.0, height: 20)
                        .background(Color(0x20ba9f))
                       .cornerRadius(15.0)

                    }
                    Spacer()
                    
                
                    Spacer()
                    Spacer()
                }
                .padding()
            
            }
        
        }
            .offset(y: editingMode ? -150 : 0)
    }.environment(\.rootPresentationMode, self.$isPresented)
}
}


struct SignInPage_Previews: PreviewProvider {
    static var previews: some View {
        Group{
                ContentViewPreviewContainer()
                }
    }
}
struct ContentViewPreviewContainer : View{
    @State var signInSuccess = false
    @State var signupYes = false
    @State var newUserCreated = false
    var body: some View {
        SignInPage(signupYes: $signupYes, signInSuccess: $signInSuccess,newUserCreated: $newUserCreated)
    }
}
