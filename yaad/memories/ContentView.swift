//
//  ContentView.swift
//  memories
//
//  Created by Toan Nguyen Dinh on 11/13/19.
//  Copyright © 2019 Toan Nguyen Dinh. All rights reserved.
//

import SwiftUI

func isValidEmail(emailStr:String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: emailStr)
}

struct ContentView: View {
    
    var store: Store = Store()
    @State var isLogin: Bool = false
    @State var isScreenLogin: Bool = true
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center) {
                if self.isLogin {
                    NavigationLink(destination: MemoryBookScreen()){
                        BlockView(title: "Memory Book", backgroundColor:Color("Primary"))
                    }
                    
                    NavigationLink(destination: CreatorScreen()){
                        BlockView(title: "Creator", backgroundColor:Color("Gray"))
                    }
                }else{
                    if(self.isScreenLogin){
                        LoginScreen(isLogin: $isLogin, isScreenLogin: $isScreenLogin)
                    }else{
                        RegisterScreen(isScreenLogin: $isScreenLogin)
                    }
                }
            }.edgesIgnoringSafeArea(.all)
            
        }
        
        
    }
}




struct BlockView: View {
    var title: String
    var backgroundColor: Color
    var body: some View{
        Text(title)
            .fontWeight(Font.Weight.bold)
            .font(.system(size: 50))
            .foregroundColor(Color.white)
            .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 0, maxHeight: .infinity, alignment: .center)
            .background(backgroundColor)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
