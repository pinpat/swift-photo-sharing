//
//  RegisterScreen.swift
//  memories
//
//  Created by Huỳnh Văn Cao Tín on 11/27/19.
//  Copyright © 2019 Toan Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct RegisterScreen: View {
    @State var email: String = ""
    @State var password: String = ""
    @Binding var isScreenLogin: Bool
    @State var onChange: Bool = false
    
    var body: some View {
        VStack{
            VStack{
                Spacer()
                VStack{
                    Image("share")
                        .resizable()
                        .frame(width: 100, height: 100)
                    Text("Member Register")
                        .font(.title)
                        .bold()
                        .padding()
                }
                Spacer()
                VStack(alignment: .leading){
                    TextField("Email", text: $email, onEditingChanged: { event in
                        self.onChange = true
                    })
                        .padding()
                        .shadow(radius: 8)
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
                    self.onChange = true
                }){
                    Text("Register")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding([.top, .bottom], 10)
                        .background(Color.black)
                }
                Spacer()
                HStack{
                    Text("Do have an account?")
                    Button(action:{
                        withAnimation{
                            self.isScreenLogin.toggle()
                        }
                    }){
                        Text("Login here")
                            .foregroundColor(.blue)
                    }.padding()
                }.padding()
                Spacer()
            }
        }.padding(20)
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    @State static var isScreenLogin: Bool = false
    static var previews: some View {
        RegisterScreen(isScreenLogin: $isScreenLogin)
    }
}
