//
//  GameModel.swift
//  Alias
//
//  Created by Valery Keplin on 26.07.22.
//

import UIKit

class GameBrain {
    //MARK: - Properties
    var timeConstant: Int = 20
    var timeOfGame: Int = 20
    var timerOfGame = Timer()
    var timeOfAction: Int = 10
    var timerOfAction = Timer()
    var wordsOfCategory: Category?
    var action: Action = Action()
    var teams: [Team] = []
    var selectedTeam: Team?
    var rounds: Int?
    var currentRound: Int = 1
    var arrayOfWords: [String?] = []
    var currentWord: String?
    var currentAction: String?
    
    //MARK: - Logic
    func gameSetup() {
        self.selectedTeam = teams[currentRound - 1]
        self.rounds = teams.count
    }
    
    func getArrayOfWords() {
        let array = wordsOfCategory?.words
        arrayOfWords = array ?? ["Error"]
    }
    
    func getRandomWord() {
        let randomWord = arrayOfWords.randomElement()
        currentWord = randomWord!!
        arrayOfWords = arrayOfWords.filter { $0 != randomWord }
    }
    
    func getRandomActionWord() {
        let randomAction = action.actionOfarray.randomElement()
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
    
    func getNextTeamName() -> String {
        return teams[currentRound].name
    }
    
    func changeSelectedTeam() {
        timeOfGame = timeConstant
        currentRound += 1
    }
    
    func saveScore() {
        for var team in teams {
            team.score = selectedTeam?.score ?? 0
        }
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
