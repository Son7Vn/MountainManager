//
//  LoginView.swift
//  MountainManager
//
//  Created by SonGoku on 13/04/2022.
//

import SwiftUI

struct LoginView: View {
    
    @State var isLoginMode = false
    @State var name = ""
    @State var password = ""
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Picker(selection: $isLoginMode,label: Text("LogCre")) {
                        Text("LogIn").tag(true)
                        Text("Create User").tag(false)
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding()
                    
                    Group {
                        TextField("Username",text: $name)
                            .keyboardType(.emailAddress)
                        SecureField("Password",text: $password)
                            
                    }.disableAutocorrection(true)
                        .autocapitalization(.none)
                    .textFieldStyle(.roundedBorder)
                        .padding()
                    
                    Button {
                        handleAction()
                    } label: {
                        Text(isLoginMode ? "Log In" : "Create User")
                    }.padding()
                        .background(Color( red: 0, green: 0, blue: 0.5))
                        .foregroundColor(.white)
                        .clipShape(Capsule())

                }
            }
            .navigationBarTitle(isLoginMode ? "Login Mode" : "Created Mode")
        }
    }
}

extension LoginView {
    func handleAction() {
        if isLoginMode {
            loginFunc()
        } else {
            createFunc()
        }
    }
    
    func loginFunc() {
        
    }
    
    func createFunc() {
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
