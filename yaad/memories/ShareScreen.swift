//
//  ShareScreen.swift
//  memories
//
//  Created by Toan Nguyen Dinh on 11/14/19.
//  Copyright © 2019 Toan Nguyen Dinh. All rights reserved.
//

import SwiftUI
import URLImage

struct ActivityView: UIViewControllerRepresentable {

    let activityItems: [Any]
    let applicationActivities: [UIActivity]?

    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityView>) -> UIActivityViewController {
        return UIActivityViewController(activityItems: activityItems,
                                        applicationActivities: applicationActivities)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController,
                                context: UIViewControllerRepresentableContext<ActivityView>) {

    }
}

struct ShareScreen: View {
    
    @State private var code: String = "E4ACFF";
    @State private var url: String = ""
    @EnvironmentObject var store: Store
    @State var showListAlbum: Bool = false
    @State private var showingSheet = false

    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            HStack(alignment: .center, spacing: 10){
                Text("Share your memory book:")
                    .foregroundColor(.secondary)
                    .font(.headline)
                
                Button(action: {
                    self.showingSheet.toggle()
                }){
                    Image("share")
                }.foregroundColor(.primary)
                .sheet(isPresented: $showingSheet,
                           content: {
                            ActivityView(activityItems: [self.code] as [Any], applicationActivities: nil) })
            
            }
            
            HStack{
                TextField("Code", text: $code)
                    .font(.headline)
                    .disabled(true)
                    .onTapGesture {
                        UIPasteboard.general.string = self.code
                    }
                if self.url == "" {
                    Image("placeholder")
                        .resizable().frame(width: 30, height: 30, alignment: .center)
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                        .onTapGesture {
                            self.showListAlbum = true
                        }
                }else {
                    URLImage(URL(string: self.url)!,
                             processors: [ Resize(size: CGSize(width: 30.0, height: 30.0), scale: UIScreen.main.scale) ],
                             content:  {
                                $0.image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .frame(width: 30.0, height: 30.0)
                                    .onTapGesture {
                                        self.showListAlbum = true
                                }
                    })
                }
            }
            .sheet(isPresented: self.$showListAlbum, content: {
                List(self.store.albums){ album in
                    HStack{
                        if album.image != "" {
                            URLImage(URL(string: album.image)!,
                                     delay: 0.25,
                                     processors: [ Resize(size: CGSize(width: 100, height: 100), scale: UIScreen.main.scale) ],
                                     content:  {
                                        $0.image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                            })
                                .frame(width: 100, height: 100)
                        }else{
                            Image("placeholder")
                                .resizable().frame(width: 100, height: 100, alignment: .center)
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                        }
                        Text("\(album.title)")
                    }.onTapGesture {
                        self.code = album.shareCode ?? ""
                        self.url = album.image
                        self.showListAlbum = false
                    }
                }.padding([.top,.bottom], 15)
            })
            .padding()
            .border(Color.primary, width: 1)
            .onAppear(){
                if self.store.albums.count > 0 {
                    self.code = self.store.albums.first!.shareCode ?? ""
                    self.url = self.store.albums.first!.image
                }
            }
        }
        .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .padding(.horizontal, 20)
        .padding(.top, 40)
        
        
    }
}

struct ShareScreen_Previews: PreviewProvider {
    static var previews: some View {
        ShareScreen()
    }
}
