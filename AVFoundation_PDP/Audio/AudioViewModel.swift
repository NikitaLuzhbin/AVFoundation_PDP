//
//  AudioViewModel.swift
//  AVFoundation_PDP
//
//  Created by Никита Лужбин on 14.12.2020.
//  Copyright © 2020 flatstack. All rights reserved.

import Foundation
import AVFoundation

class AudioViewModel: ObservableObject {

    @Published var audioDuration = 0.0
    @Published var currentProgress = 0.0

    var player: AVAudioPlayer!

    func setupAudio() {
        guard let audioPath = Bundle.main.path(forResource: "secretSong", ofType: "mp3") else {
            print("Audio wasn't found")
            return
        }

        do {
            let player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            self.player = player
            
            self.audioDuration = self.player.duration
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }

    func play() {
        self.player.prepareToPlay()
        self.player.play()
    }

    func pause() {
        self.player.pause()
    }

    func stop() {
        self.player.stop()
    }

    func setTime(_ time: Float) {
        guard let timeInterval = TimeInterval(exactly: time) else {
            return
        }

        player.currentTime = timeInterval
        player.play()
    }
}
