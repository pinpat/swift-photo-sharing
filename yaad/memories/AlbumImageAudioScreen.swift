//
//  AlbumImageAudioScreen.swift
//  memories
//
//  Created by Toan Nguyen Dinh on 11/16/19.
//  Copyright © 2019 Toan Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct AlbumImageAudioScreen: View {
    
    var audio: Audio?
    
    var body: some View {
        VStack{
            Text("Audio")
        }
    }
}

struct AlbumImageAudioScreen_Previews: PreviewProvider {
    static var previews: some View {
        AlbumImageAudioScreen(audio: Audio(id: "", url: "", duration: 10))
    }
}
