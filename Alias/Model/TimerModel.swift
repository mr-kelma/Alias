//
//  TimerModel.swift
//  Alias
//
//  Created by Valery Keplin on 29.07.22.
//

import UIKit

//MARK: - Timer for GameViewController
extension GameViewController {
    
    func timerProcessOfMainGame() {
        gameBrain?.timerOfGame.invalidate()
        gameBrain?.timerOfGame = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc
    func updateTimer() {
        if gameBrain?.timeOfGame != 0 {
            gameBrain?.timeOfGame -= 1
            timerLabel.text = String(gameBrain?.timeOfGame ?? 60)
            //Transitions to screen of action
            guard gameBrain?.timeOfGame == 10 else { return }
            self.performSegue(withIdentifier: "goToAction", sender: self)
        } else {
            gameBrain?.timerOfGame.invalidate()
            //Transitions to results screens
            guard let rounds = gameBrain?.rounds else { return }
            if gameBrain?.currentRound ?? 4 < rounds {
                self.performSegue(withIdentifier: "goToResultOfRound", sender: self)
            } else {
                self.performSegue(withIdentifier: "goToResultOfFinal", sender: self)
            }
        }
    }
}

//MARK: - Timer for ActionViewController
extension ActionViewController {
    
    func timerProcessOfAction(){
        gameBrain?.timerOfAction.invalidate()
        gameBrain?.timerOfAction = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc
    func updateTimer() {
        if gameBrain?.timeOfAction != 0 {
            gameBrain?.timeOfAction -= 1
            timerLabel.text = String(gameBrain?.timeOfAction ?? 0)
        } else {
            gameBrain?.timerOfAction.invalidate()
        }
    }
}
