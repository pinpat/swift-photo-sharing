//
//  LoginScreen.swift
//  memories
//
//  Created by Huỳnh Văn Cao Tín on 11/27/19.
//  Copyright © 2019 Toan Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct LoginScreen: View {
    @State var email: String = ""
    @State var password: String = ""
    @Binding var isLogin: Bool
    @State var onChange: Bool = false
    @Binding var isScreenLogin: Bool
    var body: some View {
        VStack{
            VStack{
                Spacer()
                Image("share")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text("Member Login")
                    .font(.title)
                    .bold()
                    .padding()
                Spacer()
                VStack(alignment: .leading){
                    TextField("Email", text: $email, onEditingChanged: { event in
                        self.onChange = true
                    })
                        .padding()
                    if !isValidEmail(emailStr: self.email) && self.onChange {
                        Text("Email is invalid!")
                            .foregroundColor(.red)
                            .padding(5)
                    }
                    SecureField("Password", text: $password)
                        .padding()
                        .shadow(radius: 8)
                    
                    if password.count < 3 && self.onChange {
                        Text("Password is invalid!")
                            .foregroundColor(.red)
                        .padding(5)
                    }

                }
                Button(action:{
                    withAnimation{
                        self.onChange = true
                        print(isValidEmail(emailStr: self.email) && self.onChange)
                        if isValidEmail(emailStr: self.email) && self.onChange {
                            self.isLogin = true
                        }
                    }
                }){
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding([.top, .bottom], 10)
                        .background(Color.black)
                }
                Spacer()
                HStack{
                    Text("Don't have an account?")
                    Button(action:{
                        withAnimation{
                            self.isScreenLogin.toggle()
                        }
                    }){
                        Text("Register here")
                            .foregroundColor(.blue)
                    }.padding()
                }.padding()
                Spacer()
            }
        }.padding(20)
    }
}

struct LoginScreen_Previews: PreviewProvider {
    @State static var isLogin: Bool = false
    @State static var isScreenLogin: Bool = true
    static var previews: some View {
        LoginScreen(isLogin: $isLogin, isScreenLogin: $isScreenLogin)
    }
}
