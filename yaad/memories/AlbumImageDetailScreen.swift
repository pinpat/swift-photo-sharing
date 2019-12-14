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
    @Binding var album: Album
    @State var selectedIndex: Int = 0
    @State var image: AlbumImage = AlbumImage(id: "", url: "")
    @State private var isFullScreen = false
    @State private var isOpenAudioScreen: Bool = false
    @State private var controlers: [UIViewController] = []
    @State private var showAction: Bool = false
    @EnvironmentObject var store: Store
    @State var type: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var sheet: ActionSheet {
        ActionSheet(
            title: Text("Do you want to delete this image?"),
            message: Text("Delete this image will also delete its data."),
            buttons: [
                .cancel(Text("Close"), action: {
                    self.showAction = false
                }),
                .destructive(Text("Remove"), action: {
                    Network.shared.apollo.perform(mutation: DeleteImageMutation(id: self.album.images[self.selectedIndex].id)){ result in
                        switch result {
                        case .success:
                            self.album.images.remove(at: self.selectedIndex)
                            self.presentationMode.wrappedValue.dismiss()
                        case.failure:
                            print(result)
                        }
                    }
                    self.showAction = false
                })
        ])
        
    }
    
    var body: some View {
        VStack{
            if !controlers.isEmpty{
                PageViewController(controllers: controlers, currentPage: $selectedIndex)
            }
        }
        .navigationBarItems(trailing: Button(action: {
            self.showAction.toggle()
        }){
            if self.store.isMemoryBook {
                Text("Delete")
            }
        }).sheet(isPresented: $isOpenAudioScreen,onDismiss: {
            Network.shared.apollo.perform(mutation: FindImageMutation(id: self.album.images[self.selectedIndex].id)){result in
                guard let data = try? result.get().data else { return }

                self.album.images[self.selectedIndex] = AlbumImage(id: data.findImage.id, url: data.findImage.image.url, whoAudio: Audio(id: data.findImage.audioWho?.id ?? "", url: data.findImage.audioWho?.url ?? ""), whereAudio: Audio(id: data.findImage.audioWhere?.id ?? "", url: data.findImage.audioWhere?.url ?? ""), whenAudio: Audio(id: data.findImage.audioWhen?.id ?? "", url: data.findImage.audioWhen?.url ?? ""))
            }
           
        }){
            AlbumImageAudioScreen(isMemoryBook: self.store.isMemoryBook, image: self.album.images[self.selectedIndex], type: self.type)
        }
        .actionSheet(isPresented: self.$showAction, content: {
            sheet
        })
        .onAppear(){
            if self.controlers.isEmpty{
                self.controlers = self.album.images.enumerated().map{(index, AlbumImage) in
                    UIHostingController(rootView: ImageDetailView(album: self.album, selectedIndex: index, isOpenAudioScreen: self.$isOpenAudioScreen, type: self.$type))
                }
            }
        }
        
    }
}


struct ImageDetailView: View{
    @State var album: Album
    var selectedIndex: Int = 0
    @Binding var isOpenAudioScreen: Bool
    @Binding var type: String
    @EnvironmentObject var store: Store

    var body: some View{
        VStack{
            if self.album.images[self.selectedIndex].url != "" {
                ImageLoader(imageURL: URL(string: self.album.images[self.selectedIndex].url))
                    .aspectRatio(contentMode: ContentMode.fit)
                    .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 0, maxHeight: .infinity, alignment: .center)
            }
            else{
                Image(uiImage: self.album.images[self.selectedIndex].imageData!).resizable()
                    .aspectRatio(contentMode: ContentMode.fit)
                    .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 0, maxHeight: .infinity, alignment: .center)
            }
            HStack(alignment: .center, spacing: 30){
                
                Button(action: {
                    self.type = "audioWho"
                    self.isOpenAudioScreen.toggle()
                }){
                    Text("Who")
                        .font(.headline)
                        .foregroundColor(.primary)
                }
                
                Button(action: {
                    self.type = "audioWhere"
                    self.isOpenAudioScreen.toggle()
                    
                }){
                    Text("Where")
                        .font(.headline)
                        .foregroundColor(.primary)
                }
                
                Button(action: {
                    self.type = "audioWhen"
                    self.isOpenAudioScreen.toggle()
                }){
                    Text("When")
                        .font(.headline)
                        .foregroundColor(.primary)
                }
            }.padding()
        }
    }
}

//struct AlbumImageDetailScreen_Previews: PreviewProvider {
//    static @State var album: Album
//    static var previews: some View {
//        AlbumImageDetailScreen(album: self.$album)
//    }
//}

