//
//  TransitionModel.swift
//  Alias
//
//  Created by Valery Keplin on 1.08.22.
//

import UIKit

//MARK: - Transition for SettingsViewController
extension SettingsViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGame" {
            let destinationVC = segue.destination as! GameViewController
            destinationVC.gameBrain = gameBrain
        }
    }
}

//MARK: - Transitions for GameViewController
extension GameViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAction" {
            let destinationVC = segue.destination as! ActionViewController
            destinationVC.gameBrain = gameBrain
        }
        if segue.identifier == "goToResultOfRound" {
            let destinationVC = segue.destination as! ResultOfRoundViewController
            destinationVC.gameBrain = gameBrain
            destinationVC.goBack = { [weak self] in
                self?.gameBrain?.changeSelectedTeam()
                self?.setupGame()
            }
        }
    }
}

//MARK: - Transitions for ResultOfRoundViewController
extension ResultOfRoundViewController: JokeManagerDelegate {
    func didUpdateJoke(_ jokeManager: JokeManager, joke: Joke) {
        DispatchQueue.main.async {
            self.jokeLabel.text = joke.content
        }
    }
    func didFailWithError(error: Error) {
        print(error)
    }
}
