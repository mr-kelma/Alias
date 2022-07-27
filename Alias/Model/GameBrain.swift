//
//  GameModel.swift
//  Alias
//
//  Created by Valery Keplin on 26.07.22.
//

import UIKit

class GameBrain {
    //MARK: - Properties
    var time: Int = 60
    var timer = Timer()
    var wordsWithCategory: Category? = nil
    var teams: [Team] = []
    var selectedTeam: Team? = nil
    var rounds: Int? = nil
    var currentRound: Int = 1
    var currentWord: String? = nil
    
    //MARK: - Logic
    func gameSetup(){
        self.selectedTeam = teams[currentRound - 1]
        self.rounds = teams.count
    }
    
    
    
    
}
