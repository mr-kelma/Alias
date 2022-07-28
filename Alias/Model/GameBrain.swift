//
//  GameModel.swift
//  Alias
//
//  Created by Valery Keplin on 26.07.22.
//

import UIKit

class GameBrain {
    //MARK: - Properties
    let time: Int = 60
    let timer = Timer()
    let wordsWithCategory: Category? = nil
    let teams: [Team] = []
    var selectedTeam: Team? = nil
    var rounds: Int? = nil
    let currentRound: Int = 1
    let currentWord: String? = nil
    
    //MARK: - Logic
    func gameSetup() {
        self.selectedTeam = teams[currentRound - 1]
        self.rounds = teams.count
    }
    
    
    
    
}
