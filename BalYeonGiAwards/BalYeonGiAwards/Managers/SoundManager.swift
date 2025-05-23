//
//  SoundManager.swift
//  BalYeonGiAwards
//
//  Created by Hyun Lee on 4/24/25.
//

import Foundation
import AVKit

class SoundManager {
    static let shared = SoundManager()
    
    var player: AVAudioPlayer?
    
    var playing: Bool = true
    
    func playSound(sound: SoundOption, loop: Bool = false) {
        guard playing else { return }
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else {return}
        do{
            player = try AVAudioPlayer(contentsOf: url)
            if loop {
                player?.numberOfLoops = -1
            } else {
                player?.numberOfLoops = 0
            }
            player?.play()
        }catch let error{
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func stopPlaying() {
        guard player != nil else { return }
        player?.stop()
    }
}


enum SoundOption: String {
    case MainBGM, SurpriseBGM, FearBGM, NeutralBGM, AngerBGM, SadnessBGM, HappyBGM, AllPhotosEffect, DrumRollEffect, RandomEmotionEffect, EmotionChosenEffect, WinnerEffect, StartButtonEffect
}
