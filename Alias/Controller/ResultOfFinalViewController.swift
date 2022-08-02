//
//  ResultOfFinalViewController.swift
//  Alias
//
//  Created by Valery Keplin on 26.07.22.
//

import UIKit

class ResultOfFinalViewController: UIViewController {

    //MARK: - Views
    @IBOutlet weak var listResultsLabel: UILabel!
    @IBOutlet weak var winningTeamLabel: UILabel!
    @IBOutlet weak var jokeLabel: UILabel!
    
    //MARK: - Properties
    var gameBrain: GameBrain?
    var jokeManager = JokeManager()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        startViews()
    }
    
    //MARK: - Setup views
    func startViews() {
        navigationItem.hidesBackButton = true
        jokeManager.delegate = self
        jokeManager.performRequest()
        listResultsLabel.text = gameBrain?.getFinalResult()
        winningTeamLabel.text = gameBrain?.getWinningTeam()
    }
    
    //MARK: - Actions
    @IBAction func finishButtonPressed(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
        gameBrain?.resetGame()
    }
}
