//
//  SoundManager.swift
//  Match App
//
//  Created by Chris Boshoff on 2022/02/21.
//

import Foundation
import AVFoundation

class SoundManager {
    
    var audioPlayer:AVAudioPlayer?
    
    enum soundAffect {
        case flip
        case match
        case nomatch
        case shuffle
    }
    
    func playSound(effect: soundAffect) {
        
      var soundFileName = ""
        
        switch effect {
            case .flip:
                soundFileName = "cardflip"
            case .match:
                soundFileName = "dingcorrect"
            case .nomatch:
                soundFileName = "dingwrong"
            case .shuffle:
                soundFileName = "shuffle"
        }
        
        // Get path to the resource
       let bundlePath = Bundle.main.path(forResource: soundFileName, ofType: ".wav")
        
        // Check that it's not nil
        guard bundlePath != nil else {
            return
        }
        
        let url = URL(fileURLWithPath: bundlePath!)
        
        do {
            // Create the audio player
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            
            // Play sound
            audioPlayer?.play()
            
        } catch {
            print("Couldn't create an audio player")
            return
        }
    }
    
    
}
