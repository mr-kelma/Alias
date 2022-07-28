//
//  TeamModel.swift
//  Alias
//
//  Created by Valery Keplin on 27.07.22.
//

import Foundation

class Team {
    var name: String
    var score: Int = 0
    var guessedWords: Int = 0
    init(name: String){
        self.name = name
    }
}
