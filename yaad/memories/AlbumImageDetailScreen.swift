//
//  AlbumImageDetailScreen.swift
//  memories
//
//  Created by Toan Nguyen Dinh on 11/14/19.
//  Copyright © 2019 Toan Nguyen Dinh. All rights reserved.
//

import SwiftUI
import URLImage
import Combine

struct AlbumImageDetailScreen: View {
    var album: Album
    @State var selectedIndex: Int = 0
    @State private var isFullScreen = false
    @State private var isOpenAudioScreen: Bool = false
    @State private var selectedAudio: Audio?
    @State private var controlers: [UIViewController] = []
    
    var body: some View {
        VStack{
            if !controlers.isEmpty{
                PageViewController(controllers: controlers, currentPage: $selectedIndex)
            }
        }
        .onAppear(){
            if self.controlers.isEmpty{
                self.controlers = self.album.images.enumerated().map{(index, AlbumImage) in
                    UIHostingController(rootView: ImageDetailView(album: self.album, selectedIndex: index, isOpenAudioScreen: self.$isOpenAudioScreen))
                }
            }
        }
        .navigationBarItems(trailing: Button(action: {}){
            Text("Delete")
        }).sheet(isPresented: $isOpenAudioScreen){
            AlbumImageAudioScreen()
        }
        
    
    }
}


struct ImageDetailView: View{
    var album: Album
    var selectedIndex: Int = 0
    @Binding var isOpenAudioScreen: Bool
    
    var body: some View{
       VStack{
           ImageLoader(imageURL: URL(string: self.album.images[self.selectedIndex].url))
            .aspectRatio(contentMode: ContentMode.fit)
           .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 0, maxHeight: .infinity, alignment: .center)
           HStack(alignment: .center, spacing: 30){
            
            Button(action: {
                self.isOpenAudioScreen.toggle()
            }){
                Text("Who")
                .font(.headline)
                .foregroundColor(.primary)
            }
            
               Button(action: {
                   
               }){
                   Text("Where")
                       .font(.headline)
                    .foregroundColor(.primary)
               }
           
               Button(action: {
                   
               }){
                   Text("When")
                       .font(.headline)
                    .foregroundColor(.primary)
               }
           }.padding()
       }
        
    }
}

struct AlbumImageDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        AlbumImageDetailScreen(album: Store().albums[0])
    }
}

