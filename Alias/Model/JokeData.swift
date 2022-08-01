//
//  JokeData.swift
//  Alias
//
//  Created by Марк Михайлов on 01.08.2022.
//

import Foundation

struct JokeData: Decodable {
    let joke: [Joke]
    }

struct Joke: Decodable {
    let setup: String
    let punchline: String
    }
    
