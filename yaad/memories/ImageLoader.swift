//
//  ImageLoader.swift
//  memories
//
//  Created by Toan Nguyen Dinh on 11/15/19.
//  Copyright © 2019 Toan Nguyen Dinh. All rights reserved.
//

import SwiftUI
import Combine

public class DataLoader: ObservableObject {

    public let objectWillChange = PassthroughSubject<Data,Never>()

    public private(set) var data = Data() {
        willSet {
            objectWillChange.send(newValue)
        }
    }

    private let resourseURL: URL?

    public init(resourseURL: URL?){
        self.resourseURL = resourseURL
    }

    public func loadImage() {
        guard let url = resourseURL else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data,_,_) in
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                self.data = data
            }
        }   .resume()
    }
}

struct ImageLoader: View {
    @ObservedObject private var imageLoader: DataLoader
    
    public init(imageURL: URL?) {
        imageLoader = DataLoader(resourseURL: imageURL)
    }
    
    var body: some View {
        if let uiImage = UIImage(data: self.imageLoader.data) {
            return AnyView(Image(uiImage: uiImage)
                            .resizable())
        } else {
            return AnyView(Image(systemName: "ellipsis")
                            .onAppear(perform: { self.imageLoader.loadImage() }))
        }
    }
}

struct ImageLoader_Previews: PreviewProvider {
    static var previews: some View {
        ImageLoader(imageURL: nil)
    }
}
