//
//  ActionBrain.swift
//  Alias
//
//  Created by Марк Михайлов on 31.07.2022.
//

import Foundation

class  ActionBrain{
    var wordsOfActionCategory: ActionWordCategory? = nil
    var teams: [Team] = []
    var selectedTeam: Team? = nil
    var currentWord: String? = nil


    func getRandomActionWord() {
        let randomActionWord = wordsOfActionCategory?.words.randomElement()
        currentWord = randomActionWord
    }

    func addPoint() {
        selectedTeam?.score += 3
        selectedTeam?.guessedWords += 3
        //Прописать сигвей на основной экран игры
    }

    func minusPoint() {
        selectedTeam?.score -= 3
        //Прописать сигвей на основной экран игры
    }

    }
