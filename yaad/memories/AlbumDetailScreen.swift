//
//  AlbumDetailScreen.swift
//  memories
//
//  Created by Toan Nguyen Dinh on 11/14/19.
//  Copyright © 2019 Toan Nguyen Dinh. All rights reserved.
//

import SwiftUI
import URLImage
import Alamofire

struct AlbumDetailScreen: View{
    @State var album: Album
    @State var showAction: Bool = false
    @State var showImagePicker: Bool = false
    @State var image: Image? = nil
    @State var uiImage: UIImage? = nil
    @State var showCamera: Bool = false
    @EnvironmentObject var store: Store
    @State var albumIndex: Int = 0

    var body: some View {
        VStack{
            
            VStack {
                if self.store.isMemoryBook {
                    VStack{
                        Button(action:{
                            let myGroup = DispatchGroup()

                            for i in 0 ..< self.album.images.count {
                                myGroup.enter()
                                if self.album.images[i].imageData != nil && self.album.images[i].url == "" {
                                    Network.shared.uploadFile(image: self.album.images[i].imageData!, data: nil, completion: { result in
                                        if result != nil {
                                            let rs = result!
                                            Network.shared.apollo.perform(mutation: SaveImageMutation(imageId: String(rs.id), albumId: self.album.id)){ response in
                                                
                                                guard let data = try? response.get().data else { return }

                                                self.album.images[i] = AlbumImage(id: data.saveImage?.id ?? "", url: rs.url)
                                                self.store.albums[self.albumIndex].images[i] = AlbumImage(id: data.saveImage?.id ?? "", url: rs.url)
                                                if(i==0){
                                                    self.store.albums[self.albumIndex].image =  rs.url
                                                }

                                                myGroup.leave()
                                            }
                                        }
                                    })
                                }
                            }

                            myGroup.notify(queue: .main) {
                                print("Finished all requests.")
                            }
                        }){
                            Text("Save")
                                .frame(width: UIScreen.main.bounds.width,alignment: .center)
                                .padding()
                                .background(Color.init(red: 202/255, green: 204/255, blue: 206/255))
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
                                .background(Color.init(red: 202/255, green: 204/255, blue: 206/255))
                                .foregroundColor(.black)
                                .font(.body)
                        }
                        .sheet(isPresented: $showImagePicker, onDismiss: {
                            if(self.uiImage != nil){
                                let newImage = AlbumImage(id: "abc", url: "", imageData: self.uiImage)
                                self.album.images.append(newImage)
                                self.store.albums[self.albumIndex].images.append(newImage)
                                print(self.album.images.count)
                                self.uiImage = nil
                            }
                        }){
                            ImagePicker(uiImage: self.$uiImage)
                        }

                        Button(action:{
                            withAnimation{
                                self.showCamera = true
                            }
                        }){
                            Text("Take Photo")
                                .frame(width: UIScreen.main.bounds.width,alignment: .center)
                                .padding()
                                .background(Color.init(red: 202/255, green: 204/255, blue: 206/255))
                                .foregroundColor(.black)
                                .font(.body)
                        }
                        .sheet(isPresented: self.$showCamera, onDismiss: {
                            self.showCamera = false
                        }, content: {
                            CameraView(showCameraView: self.$showCamera, pickedImage: self.$image)
                        })
                    }
                }
                VStack{
                    FlowStack(columns: 3, numItems: self.album.images.count, alignment: .leading) { index, colWidth in
                        NavigationLink(destination: AlbumImageDetailScreen(album: self.$album, selectedIndex: index)){
                                if self.album.images[index].url != "" {
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
                                    Image(uiImage: self.album.images[index].imageData!)
                                    .resizable().frame(width: colWidth, height: colWidth, alignment: .center)
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                }
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.horizontal, 2)
                        .padding(.vertical, 2)
                        .frame(width: colWidth, height: colWidth)

                    }
//                        .navigationBarTitle(album.title)
                }
            }
        }
    }
}

struct AlbumDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailScreen(album: Store().albums[0], albumIndex: 0)
    }
}

