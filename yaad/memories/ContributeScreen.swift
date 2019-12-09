//
//  ContributeScreen.swift
//  memories
//
//  Created by Toan Nguyen Dinh on 11/14/19.
//  Copyright © 2019 Toan Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct ContributeScreen: View {
    @State private var code: String = ""
    @State private var showToast: Bool = false
    @State private var message: String = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("Enter your invite code")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            TextField("Enter your invite code", text: $code)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .border(Color.primary, width: 1)
            
            Text("If you have been invited to contribute to their memory book, you can enter in your code here to accss it. You should receive the code via SMS")
                .foregroundColor(.secondary)
            VStack(alignment: .center, spacing: 0){
                Button(action: {
                    Network.shared.apollo.perform(mutation: AddAlbumShareMutation(shareCode: self.code)){ result in
                        let data = try? result.get().data
                        if data?.addAlbumShare.id != nil {
                            withAnimation{
                                self.message = "Add share success!"
                            }
                        }
                        else{
                            withAnimation{
                                self.message = "Add share fail!"
                            }
                        }
                        withAnimation{
                            self.showToast.toggle()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                          withAnimation {
                            self.showToast.toggle()
                            self.code = ""
                          }
                        }
                    }
                }) {
                    Text("Start Adding Memories")
                        .foregroundColor(.primary)
                        .fontWeight(.bold)
                        .font(.headline)
                }
                .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 0, maxHeight: 40, alignment: .center)
                .border(Color.primary, width: 1)
            }
            
        }
        .padding(.top, 30)
        .padding(.horizontal, 20)
        .navigationBarTitle("Contribute", displayMode: .inline)
        .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .toast(isShowing: self.$showToast, text: Text(self.message))
    }
}

struct ContributeScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContributeScreen()
    }
}
