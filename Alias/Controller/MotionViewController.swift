//
//  MotionViewController.swift
//  Alias
//
//  Created by Valery Keplin on 26.07.22.
//

import UIKit
import AVFoundation

class MotionViewController: UIViewController {

    

    @IBOutlet weak var nameTeam: UILabel!
    @IBOutlet weak var scoreTeam: UILabel!
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var questionAction: UILabel!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var wrongButton: UIButton!
    
    var actionBrain: ActionBrain = ActionBrain()
    var gameBrain: GameBrain = GameBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startViews()
        setupGame()
        
    }
    
    func setupGame() {
        //Счет команды
        scoreTeam.text = String(gameBrain.selectedTeam?.score ?? 0)
        //Название команды
        nameTeam.text = gameBrain.selectedTeam?.name
        actionBrain.getRandomActionWord()
        questionAction.text = actionBrain.currentWord
        
    }
    
    func startViews() {
        for button in [rightButton, wrongButton] {
            button?.layer.cornerRadius = 10
        }
    
    }
    @IBAction func pressedRightButton(_ sender: UIButton) {
        playSound(resource: "ВЫПОЛНИЛ")
    }
    
    @IBAction func pressedWrongButton(_ sender: UIButton) {
        playSound(resource: "НЕ ВЫПОЛНИЛ")
    }
}
