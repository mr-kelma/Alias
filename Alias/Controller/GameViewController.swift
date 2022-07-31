//
//  GameViewController.swift
//  Alias
//
//  Created by Valery Keplin on 26.07.22.
//

import UIKit

class GameViewController: UIViewController {

    //MARK: - Views
    @IBOutlet weak var outButton: UIBarButtonItem!
    @IBOutlet weak var currentTeam: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var correctButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    //MARK: - Properties
    var gameBrain: GameBrain?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupGame()
    }
    
    //MARK: - Setup views
    func setupViews() {
        for button in [correctButton, skipButton] {
            button?.layer.cornerRadius = 10
        }
        navigationItem.hidesBackButton = true
        outButton.tintColor = .white
    }
    
    func setupGame() {
        //Launch the game setup function
        gameBrain?.gameSetup()
        //Team score
        score.text = String(gameBrain?.selectedTeam?.score ?? 0)
        //Team nameды
        currentTeam.text = gameBrain?.selectedTeam?.name
        //The first word on the screen
        gameBrain?.getRandomWord()
        //Updating the word label
        wordLabel.text = gameBrain?.currentWord
        //Starting the timer
        timerProcess()
    }
    
    //MARK: - Actions
    @IBAction func outButtonPressed(_ sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewController(animated: true)
        gameBrain?.resetGame()
    }
    
    @IBAction func correctButtonPressed(_ sender: UIButton) {
        gameBrain?.addPoint()
        wordLabel.text = gameBrain?.currentWord
        score.text = String(gameBrain?.selectedTeam?.score ?? 0)
        playSound(resource: sender.titleLabel?.text ?? "ПРАВИЛЬНО")
    }
    
    @IBAction func skipButtonPressed(_ sender: UIButton) {
        gameBrain?.minusPoint()
        wordLabel.text = gameBrain?.currentWord
        score.text = String(gameBrain?.selectedTeam?.score ?? 0)
        playSound(resource: sender.titleLabel?.text ?? "ПРОПУСТИТЬ")
    }
}
