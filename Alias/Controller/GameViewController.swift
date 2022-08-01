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
    @IBOutlet weak var currentTeamLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
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
    
    override func viewDidAppear(_ animated: Bool) {
        scoreLabel.text = String(gameBrain?.selectedTeam?.score ?? 0)
    }
    
    //MARK: - Setup views
    func setupViews() {
        for button in [correctButton, skipButton] {
            button?.layer.cornerRadius = 10
        }
        outButton.tintColor = .white
        navigationItem.hidesBackButton = true
    }
    
    func setupGame() {
        //Launch the game setup function
        gameBrain?.gameSetup()
        //Team name
        currentTeamLabel.text = gameBrain?.selectedTeam?.name
        //Team score
        scoreLabel.text = String(gameBrain?.selectedTeam?.score ?? 0)
        //The first word on the screen
        gameBrain?.getRandomWord()
        //Updating the wordlabel
        wordLabel.text = gameBrain?.currentWord
        //Starting the timer
        timerProcessOfMainGame()
    }
    
    //MARK: - Actions
    @IBAction func outButtonPressed(_ sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewController(animated: true)
        gameBrain?.resetGame()
    }
    
    @IBAction func correctButtonPressed(_ sender: UIButton) {
        gameBrain?.addPointForWord()
        wordLabel.text = gameBrain?.currentWord
        scoreLabel.text = String(gameBrain?.selectedTeam?.score ?? 0)
        playSound(resource: sender.titleLabel?.text ?? "ПРАВИЛЬНО")
    }
    
    @IBAction func skipButtonPressed(_ sender: UIButton) {
        gameBrain?.minusPointForWord()
        wordLabel.text = gameBrain?.currentWord
        scoreLabel.text = String(gameBrain?.selectedTeam?.score ?? 0)
        playSound(resource: sender.titleLabel?.text ?? "ПРОПУСТИТЬ")
    }
}
