//
//  GameModel.swift
//  Alias
//
//  Created by Valery Keplin on 26.07.22.
//

import UIKit

class GameBrain {
    //MARK: - Properties
    let timeConstantOfGame: Int = 10
    var timeOfGame: Int = 10
    var timerOfGame = Timer()
    let timeConstantOfAction: Int = 5
    var timeOfAction: Int = 5
    var timerOfAction = Timer()
    var wordsOfCategory: Category?
    var action: Action = Action()
    var teams: [Team] = []
    var teamsList: [String] = []
    var teamsResult: [Int] = []
    var selectedTeam: Team?
    var rounds: Int?
    var currentRound: Int = 1
    var arrayOfWords: [String?] = []
    var currentWord: String?
    var currentAction: String?
    var finalResult: String = ""
    
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
        timeOfGame = timeConstantOfGame
        timeOfAction = timeConstantOfAction
        currentRound += 1
    }
    
    func saveResult() {
        teamsList.append(selectedTeam?.name ?? "Команда 0")
        teamsResult.append(selectedTeam?.score ?? 0)
        print(teamsList)
        print(teamsResult)
    }
    
    func getFinalResult() -> String {
        for i in 1...teamsList.count {
            finalResult += " \(teamsList[i-1]) набрала: \(teamsResult[i-1]) очков"
        }
        return finalResult
    }
    
    func getWinningTeam()  -> String {
        let maxResults = teamsResult.max() ?? 0
        let indefOfMaxResults = teamsResult.firstIndex(of: maxResults) ?? 0
        let winningTeam = "Победила: \(teamsList[indefOfMaxResults])"
        return winningTeam
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
