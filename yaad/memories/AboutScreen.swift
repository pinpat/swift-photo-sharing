//
//  AboutScreen.swift
//  memories
//
//  Created by Toan Nguyen Dinh on 11/14/19.
//  Copyright © 2019 Toan Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct AboutScreen: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("The Yaad app is supported by a robust online community. \n Please click bellow to access, this link will open your web browser and will exist from the app.")
                .font(.system(size: 20, weight: Font.Weight.light))
            Button(action: {
                if let url = URL(string: "https://www.facebook.com/Yaad-Inc-1941941426098199") {
                    UIApplication.shared.open(url)
                }
            }){
                Text("https://www.facebook.com/Yaad-Inc-1941941426098199")
                    .font(.headline)
            }
            
        }
        .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .padding(.top, 30)
        .padding(.horizontal, 20)
    }
}

struct AboutScreen_Previews: PreviewProvider {
    static var previews: some View {
        AboutScreen()
    }
}
