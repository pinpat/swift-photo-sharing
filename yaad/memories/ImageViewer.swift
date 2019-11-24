//
//  ImageViewer.swift
//  memories
//
//  Created by Toan Nguyen Dinh on 11/14/19.
//  Copyright © 2019 Toan Nguyen Dinh. All rights reserved.
//

import SwiftUI
import URLImage
struct ImageViewer: View {
    var url: String
    @Binding var isOpen:Bool
    var body: some View {
        Button(action: {
            self.isOpen.toggle()
        }){
            URLImage(URL(string: url)!,
            content:  {
                $0.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .clipped()
                })
        }.buttonStyle(PlainButtonStyle())
    }
}

struct ImageViewer_Previews: PreviewProvider {
    static var previews: some View {
        ImageViewer(url: "https://cdn.pixabay.com/photo/2019/11/09/19/23/empire-4614275_1280.jpg", isOpen: .constant(false))
    }
}
