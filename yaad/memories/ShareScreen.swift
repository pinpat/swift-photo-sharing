//
//  ShareScreen.swift
//  memories
//
//  Created by Toan Nguyen Dinh on 11/14/19.
//  Copyright © 2019 Toan Nguyen Dinh. All rights reserved.
//

import SwiftUI
import URLImage

struct ShareScreen: View {
    
    @State private var code: String = "E4ACFF";
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            HStack(alignment: .center, spacing: 10){
                Text("Share your memory book:")
                 .foregroundColor(.secondary)
                    .font(.headline)
                
                Button(action: {
                    
                }){
                    Image("share")
                    
                }.foregroundColor(.primary)
            }
            HStack{
                TextField("Code", text: $code)
                    .font(.headline)
                URLImage(URL(string: "https://cdn.pixabay.com/photo/2019/11/10/16/47/nature-4616282_1280.jpg")!,
                         processors: [ Resize(size: CGSize(width: 30.0, height: 30.0), scale: UIScreen.main.scale) ],
                content:  {
                    $0.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    
                })
                    .frame(width: 30.0, height: 30.0)
                    
                
            }
            .padding()
            .border(Color.primary, width: 1)
            
        }
        .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .padding(.horizontal, 20)
        .padding(.top, 40)

    }
}

struct ShareScreen_Previews: PreviewProvider {
    static var previews: some View {
        ShareScreen()
    }
}
