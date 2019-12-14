//
//  AlbumImageAudioScreen.swift
//  memories
//
//  Created by Toan Nguyen Dinh on 11/16/19.
//  Copyright © 2019 Toan Nguyen Dinh. All rights reserved.
//
import SwiftUI
import AVFoundation
import Combine

struct AlbumImageAudioScreen: View {
    
    var isMemoryBook: Bool
    @State var image: AlbumImage = AlbumImage(id: "", url: "")
    @State var audio: Audio? = Audio(id: "", url: "")
    var type: String
    @ObservedObject var audioPlayer: AudioPlayer = AudioPlayer()
    @ObservedObject var audioRecorder: AudioRecorder = AudioRecorder()
    let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    @State var audioFilename = URL(fileURLWithPath: "")
    @State var duration = 0
    @State var timeRemaining = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var downTime = false
    @State var upTime = false
    @State var record = false
    
    func timeFormatted(totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    var body: some View {
        VStack{
            VStack{
                Text(String(self.timeFormatted(totalSeconds: self.timeRemaining)))
                    .padding()
                    .font(.title)
                    .onReceive(timer){ _ in
                        if self.downTime {
                            self.timeRemaining -= 1
                        }
                        if self.upTime {
                            self.timeRemaining += 1
                        }
                        if self.timeRemaining <= 0{
                            self.downTime = false
                        }
                }
                if self.isMemoryBook {
                    Button(action:{
                        withAnimation{
                            self.audioFilename = self.documentPath.appendingPathComponent("\(Date().toString(dateFormat: "dd-MM-YY_'at'_HH:mm:ss")).m4a")
                            if self.audioRecorder.recording == false {
                                self.audioRecorder.startRecording(audioFileName: self.audioFilename)
                                self.timeRemaining = 0
                                self.upTime = true
                                self.record = true
                            }else{
                                self.audioRecorder.stopRecording()
                                self.upTime = false
                            }
                        }
                    }){
                        if self.audioRecorder.recording == false {
                            Text("Record")
                                .frame(width: UIScreen.main.bounds.width,alignment: .center)
                                .padding()
                                .background(Color.init(red: 202/255, green: 204/255, blue: 206/255))
                                .foregroundColor(.black)
                                .font(.body)
                        }else{
                            Text("Stop")
                            .frame(width: UIScreen.main.bounds.width,alignment: .center)
                            .padding()
                            .background(Color.init(red: 202/255, green: 204/255, blue: 206/255))
                            .foregroundColor(.black)
                            .font(.body)
                        }
                        
                    }
                }

                Button(action:{
                    print(self.record)
                    if !self.audioPlayer.isPlaying && !self.record {
                        self.audioPlayer.downloadFileFromURL(url: URL(string: self.audio!.url)!, callback: { result in
                            self.audioPlayer.startPlayback(audio: result!)
                            self.timeRemaining = self.duration
                            self.downTime = true
                        })
                    }else if !self.audioPlayer.isPlaying && self.record {
                        self.audioPlayer.startPlayback(audio: self.audioRecorder.recordings.last!.fileURL)
                        self.timeRemaining = Int(self.audioPlayer.audioPlayer.duration)
                        self.downTime = true
                    }
                }){
                    Text("Play")
                        .frame(width: UIScreen.main.bounds.width,alignment: .center)
                        .padding()
                        .background(Color.init(red: 202/255, green: 204/255, blue: 206/255))
                        .foregroundColor(.black)
                        .font(.body)
                }
                if self.isMemoryBook {
                    Button(action:{
                        Network().uploadFile(image: nil, data: try? Data(contentsOf: self.audioRecorder.recordings.last!.fileURL), completion: { result in
                            if result != nil {
                                Network.shared.apollo.perform(mutation: SaveAudioMutation(id: self.image.id, audioId: String(result!.id), type: self.type)) {rs in
                                    guard let dt = try? rs.get().data else { return }
                                    let audio = Audio(id: String(result!.id), url: result!.url)
                                    switch self.type {
                                        case "audioWho":
                                            self.image.whoAudio = audio
                                        case "audioWhen":
                                            self.image.whenAudio = audio
                                        case "audioWhere":
                                            self.image.whereAudio = audio
                                        default:
                                            print(dt)
                                    }
                                    self.audio = audio
                                }
                            }
                        })
                    }){
                        Text("Upload")
                            .frame(width: UIScreen.main.bounds.width,alignment: .center)
                            .padding()
                            .background(Color.init(red: 202/255, green: 204/255, blue: 206/255))
                            .foregroundColor(.black)
                            .font(.body)
                    }
                }
            }
            Spacer()
        }.onAppear(){
//            self.image = self.store.selectedImage
            switch self.type {
                case "audioWho":
                    self.audio = self.image.whoAudio
                case "audioWhere":
                    self.audio = self.image.whereAudio
                case "audioWhen":
                    self.audio = self.image.whenAudio
                default:
                    print("")
            }
            if self.audio != nil && self.audio!.url != ""{
                self.audioPlayer.downloadFileFromURL(url: URL(string: self.audio!.url)!, callback: { result in
                    do {
                        let audio = try AVAudioPlayer(contentsOf: result!)
                        self.duration = Int(audio.duration)
                        self.timeRemaining = self.duration
                    }catch {
                        
                    }
                })
            }
            
        }
    }
}

//struct AlbumImageAudioScreen_Previews: PreviewProvider {
//    @State static var audio: Audio? = Audio(id: "", url: "", duration: 10)
//    @State static var image: AlbumImage = Store().albums[0].images.first
//    static var previews: some View {
//        AlbumImageAudioScreen(audio: self.$audio,image: self.image!, type: "audioWho")
//    }
//}
