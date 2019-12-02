//
//  MemoryBookScreen.swift
//  memories
//
//  Created by Toan Nguyen Dinh on 11/14/19.
//  Copyright © 2019 Toan Nguyen Dinh. All rights reserved.
//

import SwiftUI
import RxSwift

struct MemoryBookScreen: View {
    
    @EnvironmentObject var store: Store
    
    var body: some View {
        VStack(alignment: .leading, spacing: 1.0){
            List{
                NavigationLink(destination: Albums()){
                    MenuItemView(title: "Memory Book")
                }
                NavigationLink(destination: ContributeScreen()){
                    MenuItemView(title: "Contribute")
                }
                NavigationLink(destination: ShareScreen()){
                    MenuItemView(title: "Share")
                }
                NavigationLink(destination: AboutScreen()){
                    MenuItemView(title: "About")
                }
            }
            
            
        }
        .navigationBarTitle("Yaad", displayMode: .inline)
        .onAppear(perform: {
            Network.shared.apollo.fetch(query: FindAllAlbumQuery()){ result in
                switch result {
                case .success:
                    guard let data = try? result.get().data else { return }
                    self.store.albums = []
                    if !data.findAllAlbum!.isEmpty {
                        for album in data.findAllAlbum! {
                            var images: [AlbumImage] = []
                            for image in album.images! {
                                images.append(AlbumImage(id: image!.id, url: image!.image.url, whoAudio: Audio(id: image!.audioWho?.id ?? "", url: image!.audioWho?.url ?? ""), whereAudio: Audio(id: image!.audioWhere?.id ?? "", url: image!.audioWhere?.url ?? ""), whenAudio: Audio(id: image!.audioWhen?.id ?? "", url: image!.audioWhen?.url ?? "")))
                            }
                            if images.count > 0 {
                                self.store.albums.append(Album(id: album.id, title: album.name, image: images.first!.url, images: images))
                            }else{
                                self.store.albums.append(Album(id: album.id, title: album.name, image: "", images: images))
                            }
                        }
                        print(self.store.albums)
                    }
                case .failure:
                    print(result)
                }
            }
        })
    }
}

struct MemoryBookScreen_Previews: PreviewProvider {
    static var previews: some View {
        MemoryBookScreen()
    }
}
