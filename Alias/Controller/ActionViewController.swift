//
//  MotionViewController.swift
//  Alias
//
//  Created by Valery Keplin on 26.07.22.
//

import UIKit
import AVFoundation

class ActionViewController: UIViewController {

    //MARK: - Views
    @IBOutlet weak var currentTeam: UILabel!
    @IBOutlet weak var currentTeamLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var actionLabel: UILabel!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var wrongButton: UIButton!
    
    //MARK: - Properties
    var gameBrain: GameBrain?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        startViews()
        setupGame()
    }
    
    //MARK: - Setup views
    func startViews() {
        for button in [rightButton, wrongButton] {
            button?.layer.cornerRadius = 10
        }
    }

    func setupGame() {
        navigationItem.hidesBackButton = true
        //Team score
        scoreLabel.text = String(gameBrain?.selectedTeam?.score ?? 0)
        //Team nameды
        currentTeamLabel.text = gameBrain?.selectedTeam?.name
        //The action on the screen
        gameBrain?.getRandomActionWord()
        //Updating the actionlabel
        actionLabel.text = gameBrain?.currentAction
    }
    
    //MARK: - Actions
    @IBAction func pressedRightButton(_ sender: UIButton) {
        gameBrain?.addPointForAction()
        navigationController?.popViewController(animated: true)
        playSound(resource: "ВЫПОЛНИЛ")
    }
    
    @IBAction func pressedWrongButton(_ sender: UIButton) {
        gameBrain?.minusPointForAction()
        navigationController?.popViewController(animated: true)
        playSound(resource: "НЕ ВЫПОЛНИЛ")
    }
}
