//
//  AddProvidersPage.swift
//  MobileApp
//
//  Created by Marketing Sharks on 23.01.2022.
//

import SwiftUI

struct AddProvidersText : View {
    var body : some View {
        return Text("Add providers").font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
            .foregroundColor(Color.white)
    }
}

struct FirstNameTextField : View {
    
    @Binding var firstName: String
    
    @Binding var editingMode: Bool
    
    var body: some View {
        return TextField("First name", text: $firstName, onEditingChanged: {edit in
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

struct LastNameTextField : View {
    
    @Binding var lastName: String
    
    @Binding var editingMode: Bool
    
    var body: some View {
        return TextField("Last name", text: $lastName, onEditingChanged: {edit in
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

struct AddProvidersButtonContent : View {
    var body : some View {
        return Text("Add Providers +").font(.headline)
        //change
        .foregroundColor(Color(0x20ba9f))
        .padding()
        .frame(width: 300, height: 60)
        .background(Color.white)
        .cornerRadius(5.0)
    }
}

struct NewProvider : View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var editingMode: Bool = false
    var body: some View {
        return VStack{
            HStack{
                FirstNameTextField(firstName: $firstName, editingMode: $editingMode).padding(.horizontal)
                LastNameTextField(lastName: $lastName, editingMode: $editingMode).padding(.horizontal)
            }
            EmailTextField(email: $email, editingMode: $editingMode).padding(.horizontal)
        }
    }
}



struct AddProvidersPage: View {
    @State var action: Int? = 0
    @Binding var newUserCreated: Bool
        @Binding var signupYes: Bool
        @Binding var signInSuccess: Bool
    @Binding var editingMode: Bool
    @Binding var firstName: String
    @Binding var lastName: String
    @State var providers = [""]
    
    @Environment(\.rootPresentationMode) private var rootPresentationMode
    var body: some View {
        
            ZStack{
                Color(0x20ba9f).ignoresSafeArea()
                VStack{
                    AddProvidersText()
                    Spacer()
                    Spacer()
                    ScrollView{
                    VStack{
                        ForEach(providers.indices, id: \.self){
                            index in NewProvider(firstName: firstName, lastName:  lastName, editingMode: editingMode)
                        }
                    }
                    
                }
                    Spacer()
                    NavigationLink(destination: LeadInfoPage(newUserCreated: $newUserCreated, signupYes: $signupYes, signInSuccess: $signInSuccess),tag: 5, selection: $action){
                        Text("Lead info ->").font(.headline)
                            //change
                            .foregroundColor(Color(0x20ba9f))
                            .padding()
                        
                            .frame(width: 300, height: 60)
                            .background(Color.white)
                            .cornerRadius(5.0)
                            .onTapGesture {
                                self.rootPresentationMode.wrappedValue.dismiss()
                                self.action=5
                            }
                                                }
                    .isDetailLink(false)
                    VStack{
                        Button(action: {providers.append("")}){
                            AddProvidersButtonContent()
                    }
                        .padding()
                }
                    
                }
            }
}
}

struct AddProvidersPage_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            AddProvidersPreviewContainer()
        }
    }
}

struct AddProvidersPreviewContainer : View{
    @State var signInSuccess = false
    @State var signupYes = false
    @State var newUserCreated = false
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var ingredientNames = [""]
    @State var editingMode: Bool = false
    
    var body: some View {
        AddProvidersPage(newUserCreated: $newUserCreated, signupYes: $signupYes, signInSuccess: $signInSuccess,editingMode: $editingMode, firstName: $firstName, lastName: $lastName)
    }
}
