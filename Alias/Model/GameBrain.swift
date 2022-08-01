//
//  GameModel.swift
//  Alias
//
//  Created by Valery Keplin on 26.07.22.
//

import UIKit

class GameBrain {
    //MARK: - Properties
    var time: Int = 20
    var timer = Timer()
    var wordsOfCategory: Category? = nil
    var actionOfCategory: ActionWordCategory? = nil
    var teams: [Team] = []
    var selectedTeam: Team? = nil
    var rounds: Int? = nil
    var currentRound: Int = 1
    var currentWord: String? = nil
    var currentAction: String? = nil
    
    //MARK: - Logic
    func gameSetup() {
        self.selectedTeam = teams[currentRound - 1]
        self.rounds = teams.count
    }
    
    func getRandomWord() {
        let randomWord = wordsOfCategory?.words.randomElement()
        currentWord = randomWord
        
        //добавить функционал, исключающий выпавшее слово из массива
//        let modifiedArray = array.filter { $0 != randomNumber }
    }
    
    func getRandomActionWord() {
        let randomAction = actionOfCategory?.words.randomElement()
        currentAction = randomAction
    }
    
    func addPointForWord() {
        selectedTeam?.score += 1
        getRandomWord()
    }
    
    func minusPointForWord() {
        selectedTeam?.score -= 1
        getRandomWord()
    }
    
    func addPointForAction() {
        selectedTeam?.score += 3

    }
    
    func minusPointForAction() {
        selectedTeam?.score -= 3
    }
    
    func getNextTeamName() -> String{
        return teams[currentRound].name
    }
    
    func changeSelectedTeam() {
        currentRound += 1
    }
    
    func resetGame() {
        for var team in teams {
            team.score = 0
        }
        selectedTeam = nil
        currentRound = 1
        rounds = nil
    }
}
