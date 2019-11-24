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
}
struct Audio: Identifiable{
    var id: String
    var url: String
    var duration: Int
}
struct AlbumImage: Identifiable{
    let id: String
    var url: String
    var whoAudio: Audio?
    var whereAudio: Audio?
    var whenAudio: Audio?
}

final class Store: ObservableObject {
    
    @Published var albums: [Album] = [
        Album(id: "001", title: "Album 1", image: "https://cdn.pixabay.com/photo/2019/11/07/14/09/sky-4608972_1280.jpg", images: [
            AlbumImage(id: "001", url: "https://cdn.pixabay.com/photo/2019/11/10/16/47/nature-4616282_1280.jpg", whoAudio: Audio(id: "01", url: "https://file-examples.com/wp-content/uploads/2017/11/file_example_MP3_2MG.mp3", duration: 20)),
            AlbumImage(id: "002", url: "https://cdn.pixabay.com/photo/2019/11/08/09/27/panorama-4610864_1280.jpg"),
            AlbumImage(id: "003", url: "https://cdn.pixabay.com/photo/2019/11/07/14/09/sky-4608972_1280.jpg"),
            AlbumImage(id: "004", url: "https://cdn.pixabay.com/photo/2019/11/09/14/55/nature-4613735_1280.jpg")
            
        ]),
        Album(id: "002", title: "Album 2", image: "https://cdn.pixabay.com/photo/2019/11/08/09/27/panorama-4610864_1280.jpg", images: [])
    ]
}

