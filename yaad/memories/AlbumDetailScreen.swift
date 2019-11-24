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
    var album: Album
    @State var showAction: Bool = false
    @State var showImagePicker: Bool = false
    @State var uiImage: UIImage? = nil
    @State var showCamera: Bool = false
    @State var image: Image? = nil
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
                    self.showImagePicker = false
                }, content: {
                    ImagePicker(isShown: self.$showImagePicker, uiImage: self.$uiImage)
                })

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
                FlowStack(columns: 3, numItems: album.images.count, alignment: .leading) { index, colWidth in
                    NavigationLink(destination: AlbumImageDetailScreen(album: self.album, selectedIndex: index)){
                        ImageLoader(imageURL: URL(string: self.album.images[index].url))
                            .frame(width: colWidth, height: colWidth, alignment: .center)
                            .aspectRatio(contentMode: .fill)
                            .clipped()
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

struct AlbumDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailScreen(album: Store().albums[0])
    }
}

