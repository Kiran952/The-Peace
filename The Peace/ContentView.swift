//
//  ContentView.swift
//  The Peace
//
//  Created by Arun Amuri on 19/06/2021.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State var audioPlayer: AVAudioPlayer!
    @State var count = 1
    var body: some View {
        ZStack {
            
            Color.backgroundColor
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Music Player").font(.system(size: 45)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.buttonColor)
                    padding()
                }
                HStack {
                    Button(action: {
                        self.audioPlayer.play()
                    }) {
                        Image(systemName: "play.circle.fill")
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.buttonColor)
                }
                    Button(action: {
                        self.audioPlayer.pause()
                    }) {
                        Image(systemName: "pause.circle.fill")
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.buttonColor)
                }
                    Button(action: {
                        if self.count < 4 {
                            self.count += 1  //we haveonly  four songs
                        } else {
                            self.count = 1
                        }
                        let sound = Bundle.main.path(forResource: "song\(self.count)", ofType: "mp3")
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL (fileURLWithPath: sound!))
                        self.audioPlayer.play()
                    }) {
                        Image(systemName: "forward.end")
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.buttonColor)
                }
            }
        }
    }
        .onAppear {
            let sound = Bundle.main.path(forResource: "song1", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL (fileURLWithPath: sound!))
            
        }
            
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


