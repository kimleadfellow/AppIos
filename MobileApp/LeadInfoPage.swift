//
//  LeadInfoPage.swift
//  MobileApp
//
//  Created by Marketing Sharks on 23.01.2022.
//

import SwiftUI
import iPhoneNumberField

struct LeadInfoText : View {
    var body : some View {
        return Text("Lead info").font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
            .foregroundColor(Color.white)
    }
}

struct CompanyTextField : View {
    
    @Binding var company: String
    
    @Binding var editingMode: Bool
    
    var body: some View {
        return TextField("Company", text: $company, onEditingChanged: {edit in
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

struct AdditionalInfoTextField : View {
    
    @Binding var info: String
    
    @Binding var editingMode: Bool
    
    var body: some View {
        return TextField("Additional info", text: $info, onEditingChanged: {edit in
            if edit == true
            {self.editingMode = true}
            else
            {self.editingMode = false}
        })
            .padding()
        .background(Color.white)
        
            .padding(.horizontal, 5.0)
            .frame(width: 380,height: 100).background(Color.white).cornerRadius(5.0)
        
    }
}

struct LeadInfoPage : View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var company: String = ""
    @State var info: String = ""
    @State var number = ""
    @State var editingMode: Bool = false
    
    @Binding var newUserCreated: Bool
    @Binding var signupYes: Bool
    @Binding var signInSuccess: Bool
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body : some View {
            ZStack{
                Color(0x20ba9f).ignoresSafeArea()
                VStack{
                    LeadInfoText()
                    Spacer()
                    HStack{
                        FirstNameTextField(firstName: $firstName, editingMode: $editingMode)
                        LastNameTextField(lastName: $lastName, editingMode: $editingMode)
                        
                    }
                    EmailTextField(email: $email, editingMode: $editingMode)
                    iPhoneNumberField("Phone", text: $number).flagHidden(true)
                        .flagSelectable(true)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5.0)
                    .padding(.horizontal, 5.0)
                    CompanyTextField(company: $company, editingMode: $editingMode)
                    AdditionalInfoTextField(info: $info, editingMode: $editingMode)
                        
                    Spacer()
                    NavigationLink(destination: SignInPage( signupYes: $signupYes, signInSuccess: $signInSuccess, newUserCreated: $newUserCreated)){
                        Text("Send lead").font(.headline)
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


struct LeadInfoPage_Previews: PreviewProvider {
    static var previews: some View {
        LeadInfoPagePreviewContainer()
    }
}

struct LeadInfoPagePreviewContainer : View{
    @State var signInSuccess = false
    @State var signupYes = false
    @State var newUserCreated = false
    var body: some View {
        LeadInfoPage(newUserCreated: $newUserCreated, signupYes: $signupYes, signInSuccess: $signInSuccess)
    }
}
