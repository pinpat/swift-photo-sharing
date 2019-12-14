//
//  Store.swift
//  memories
//
//  Created by Toan Nguyen Dinh on 11/14/19.
//  Copyright © 2019 Toan Nguyen Dinh. All rights reserved.
//

import SwiftUI
import Combine

struct Album: Identifiable {
    var id: String
    var title: String
    var image: String
    var images: [AlbumImage]
    var shareCode: String?
}

struct Audio: Identifiable{
    var id: String
    var url: String
    var duration: Int?
}

struct AlbumImage: Identifiable{
    let id: String
    var url: String
    var whoAudio: Audio?
    var whereAudio: Audio?
    var whenAudio: Audio?
    var imageData: UIImage?
}

final class Store: ObservableObject {
    
    @Published var albums: [Album] = []
    
    @Published var isMemoryBook: Bool = true
    
    func onLoadData() -> Void {
        Network.shared.apollo.fetch(query: FindAllAlbumQuery(), cachePolicy: .fetchIgnoringCacheData){ result in
            switch result {
                case .success:
                    guard let data = try? result.get().data else { return }
                    self.albums = []
                    for album in data.findAllAlbum ?? [] {
                        var images: [AlbumImage] = []
                        for image in album.images! {
                            images.append(AlbumImage(id: image!.id, url: image!.image.url, whoAudio: Audio(id: image!.audioWho?.id ?? "", url: image!.audioWho?.url ?? ""), whereAudio: Audio(id: image!.audioWhere?.id ?? "", url: image!.audioWhere?.url ?? ""), whenAudio: Audio(id: image!.audioWhen?.id ?? "", url: image!.audioWhen?.url ?? "")))
                        }

                        self.albums.append(Album(id: album.id, title: album.name, image: images.first?.url ?? "" , images: images, shareCode: album.shareCode))
                    }
                case .failure:
                    print(result)
            }
        }
    }
}

