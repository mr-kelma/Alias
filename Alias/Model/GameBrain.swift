//
//  GameModel.swift
//  Alias
//
//  Created by Valery Keplin on 26.07.22.
//

import UIKit

class GameBrain {
    //MARK: - Properties
    var time: Int = 10
    var timer = Timer()
    var wordsOfCategory: Category? = nil
    var teams: [Team] = []
    var selectedTeam: Team? = nil
    var rounds: Int? = nil
    var currentRound: Int = 1
    var currentWord: String? = nil
    
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
    
    func addPoint() {
        selectedTeam?.score += 1
        selectedTeam?.guessedWords += 1
        getRandomWord()
    }
    
    func minusPoint() {
        selectedTeam?.score -= 1
        getRandomWord()
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
            team.guessedWords = 0
        }
        selectedTeam = nil
        currentRound = 1
        rounds = nil
    }
}
