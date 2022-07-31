//
//  TimerModel.swift
//  Alias
//
//  Created by Valery Keplin on 29.07.22.
//

import UIKit


//MARK: - Timer for GameViewController
extension GameViewController {
    
    func timerProcess(){
        gameBrain?.timer.invalidate()
        gameBrain?.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc
    func updateTimer() {
        if gameBrain?.time != 0 {
            gameBrain?.time -= 1
            timerLabel.text = String(gameBrain?.time ?? 0)
        } else {
            gameBrain?.time = 0
            gameBrain?.timer.invalidate()
            //Переходы на экраны результатов
            guard let rounds = gameBrain?.rounds else {return}
            if gameBrain?.currentRound ?? 1 < rounds {
            self.performSegue(withIdentifier: "goToResultOfRound", sender: self)
            } else {
                self.performSegue(withIdentifier: "goToResultOfFinal", sender: self)
            }
        }
    }
}
