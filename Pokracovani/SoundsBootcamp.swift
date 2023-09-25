//
//  SoundsBootcamp.swift
//  Pokracovani
//
//  Created by Tomáš Jakubec on 17.08.2023.
//

import SwiftUI

// načtení frameworku AVKit - přehrávač audia a videa
import AVKit

class SoundManager {
    
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case tada
        case badum
    }
    
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error \(error.localizedDescription)")
        }
       
    }
}

struct SoundsBootcamp: View {
    
    
    var body: some View {
        VStack(spacing: 40) {
            Button("Play sond 1") {
                SoundManager.instance.playSound(sound: .tada)
                
            }
            Button("Play sond 2") {
                SoundManager.instance.playSound(sound: .badum)
                
            }
        }
    }
}

struct SoundsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SoundsBootcamp()
    }
}
