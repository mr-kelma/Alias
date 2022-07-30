//
//  SoundModel.swift
//  Alias
//
//  Created by Valery Keplin on 27.07.22.
//

import UIKit
import AVFoundation

var player: AVAudioPlayer!

func playSound(resource: String) {
    let url = Bundle.main.url(forResource: resource, withExtension: "wav")
    player = try! AVAudioPlayer(contentsOf: url!)
    player.play()
}
