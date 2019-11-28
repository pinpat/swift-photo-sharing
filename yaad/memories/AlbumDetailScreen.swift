//
//  AlbumDetailScreen.swift
//  memories
//
//  Created by Toan Nguyen Dinh on 11/14/19.
//  Copyright © 2019 Toan Nguyen Dinh. All rights reserved.
//

import SwiftUI
import URLImage


struct AlbumDetailScreen: View{
    @State var album: Album
    @State var showAction: Bool = false
    @State var showImagePicker: Bool = false
    @State var image: Image? = nil
    @State var showCamera: Bool = false
    @EnvironmentObject var store: Store
    @State var albumIndex: Int = 0
    
    var body: some View {
        VStack{
            
            VStack {
                Button(action:{
                    withAnimation{
                        
                    }
                }){
                    Text("Save")
                        .frame(width: UIScreen.main.bounds.width,alignment: .center)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.black)
                        .font(.body)
                }
                
                self.image?.resizable().frame(width: 100, height: 100)
                
                Button(action:{
                    withAnimation{
                        self.showImagePicker = true
                    }
                }){
                    Text("Select From Gallery")
                        .frame(width: UIScreen.main.bounds.width,alignment: .center)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.black)
                        .font(.body)
                }
                .sheet(isPresented: $showImagePicker, onDismiss: {
                    if(self.image != nil){
                        let newImage = AlbumImage(id: "009", url: "", imageData: self.image)
                        self.album.images.append(newImage)
                        self.store.albums[self.albumIndex].images.append(newImage)
                        print(self.album.images.count)
                        self.image = nil
//                        print(self.store.albums[self.albumIndex].images)
                    }
                }){
                    ImagePicker(image: self.$image)
                }

                Button(action:{
                    withAnimation{
                        self.showCamera = true
                    }
                }){
                    Text("Take Photo")
                        .frame(width: UIScreen.main.bounds.width,alignment: .center)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.black)
                        .font(.body)
                }
                .sheet(isPresented: self.$showCamera, onDismiss: {
                    self.showCamera = false
                }, content: {
                    CameraView(showCameraView: self.$showCamera, pickedImage: self.$image)
                })
                VStack{
                    FlowStack(columns: 3, numItems: self.store.albums[self.albumIndex].images.count, alignment: .leading) { index, colWidth in
                        NavigationLink(destination: AlbumImageDetailScreen(album: self.album, selectedIndex: index)){
                            if index < self.album.images.count {
                                if self.album.images[index].url != "" {
                                    /*ImageLoader(imageURL: URL(string: self.album.images[index].url))
                                    .frame(width: colWidth, height: colWidth, alignment: .center)
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()*/
                                   
                                    URLImage(URL(string: self.album.images[index].url)!,
                                    delay: 0.25,
                                    processors: [ Resize(size: CGSize(width: colWidth, height: colWidth), scale: UIScreen.main.scale) ],
                                    content:  {
                                        $0.image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    })
                                        .frame(width: colWidth, height: colWidth)
                                    
                                    
                                }else{
                                    self.album.images[index].imageData?.resizable()
                                    .frame(width: colWidth, height: colWidth, alignment: .center)
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                }
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.horizontal, 2)
                        .padding(.vertical, 2)
                        .frame(width: colWidth, height: colWidth)

                    }.padding(2)
                        .navigationBarTitle(album.title)
                }
            }
        }
    }
}

struct AlbumDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailScreen(album: Store().albums[0])
    }
}

