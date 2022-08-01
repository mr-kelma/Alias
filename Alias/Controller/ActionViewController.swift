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
    @IBOutlet weak var timerLabel: UILabel!
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
        navigationItem.hidesBackButton = true
    }

    func setupGame() {
        //Team score
        scoreLabel.text = String(gameBrain?.selectedTeam?.score ?? 0)
        //Team nameды
        currentTeamLabel.text = gameBrain?.selectedTeam?.name
        //The action on the screen
        gameBrain?.getRandomActionWord()
        //Updating the actionlabel
        actionLabel.text = gameBrain?.currentAction
        //Starting the timer
        timerProcessOfAction()
    }
    
    //MARK: - Actions
    @IBAction func outButtonPressed(_ sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewController(animated: true)
        gameBrain?.resetGame()
    }
    
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
