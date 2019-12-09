//
//  Albums.swift
//  memories
//
//  Created by Toan Nguyen Dinh on 11/14/19.
//  Copyright © 2019 Toan Nguyen Dinh. All rights reserved.
//

import SwiftUI
import URLImage

struct Albums: View {

    @State private var isOpenAlert = false
    @State private var newAlbumTitle: String = ""
    @EnvironmentObject var store: Store
    @State var isActive: Bool = false
    var body: some View{
        GeometryReader { geometry in
            ScrollView(Axis.Set.vertical) {
            VStack(alignment: .leading, spacing: 2){
                ForEach(0..<self.store.albums.count, id: \.self) { index in
                    NavigationLink(destination: AlbumDetailScreen(album: self.store.albums[index], albumIndex: index)){
                        ZStack(alignment: .center){
                            if self.store.albums[index].image == "" {
                                Image("placeholder")
                                .frame(width: geometry.size.width, height: 250, alignment: .center)
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                                Text(self.store.albums[index].title)
                                .font(.headline)
                                .foregroundColor(.black)
                            }else{
                                ImageLoader(imageURL: URL(string: self.store.albums[index].image))
                                .frame(width: geometry.size.width, height: 250, alignment: .center)
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                                Text(self.store.albums[index].title)
                                .font(.headline)
                                .foregroundColor(.white)
                            }
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.horizontal, 2)
                    .padding(.vertical, 2)
                    .frame(width: geometry.size.width, height: 250)
                }
            }
            .navigationBarItems(trailing: Button(action: {
                self.isOpenAlert.toggle()
            }){
                Text("Add")
            })
                .padding(2).sheet(isPresented: self.$isOpenAlert) {
                VStack(alignment: .leading, spacing: 10){
                    Text("New Album").font(.headline).fontWeight(.bold)
                        .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 0, maxHeight: 40, alignment: .center)
                    TextField("Enter album title", text: self.$newAlbumTitle)
                    .padding()
                        .border(Color.primary, width: 1)
                    Button(action: {
                        self.isOpenAlert.toggle()
                        print(self.$newAlbumTitle)
                        
                        if(self.$newAlbumTitle.wrappedValue != ""){
                            // handle create new album
                            Network.shared.apollo.perform(mutation: SaveAlbumMutation(name: self.$newAlbumTitle.wrappedValue)){ result in
                                switch result {
                                    case .success:
                                        let newAlbum = Album(id: UUID().uuidString, title: self.$newAlbumTitle.wrappedValue, image: "", images: [])
                                        self.store.albums.append(newAlbum)
                                        
                                    case .failure:
                                        print(result)
                                }
                            }
                        }
                    }){
                        Text("Continue")
                            .foregroundColor(.primary)
                            .fontWeight(.bold)
                    }.padding()
                        .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity, minHeight: 40, idealHeight: 0, maxHeight: 40, alignment: .center)
                    .border(Color.primary, width: 1)
                }.frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 0, maxHeight: 300, alignment: .topLeading)
                    .padding(.horizontal, 20)
            }
            
        }
    }
        
        
    }
}


struct Albums_Previews: PreviewProvider {
    static var previews: some View {
        Albums()
    }
}
