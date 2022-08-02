//
//  ResultOfFinalViewController.swift
//  Alias
//
//  Created by Valery Keplin on 26.07.22.
//

import UIKit

class ResultOfFinalViewController: UIViewController {

    //MARK: - Views
    @IBOutlet weak var outButton: UIBarButtonItem!
    @IBOutlet weak var listResultsLabel: UILabel!
    @IBOutlet weak var winningTeamLabel: UILabel!
    
    //MARK: - Properties
    var gameBrain: GameBrain?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        startViews()
    }
    
    //MARK: - Setup views
    func startViews() {
        navigationItem.hidesBackButton = true
        outButton.tintColor = .white
        listResultsLabel.text = gameBrain?.getFinalResult()
        winningTeamLabel.text = gameBrain?.getWinningTeam()
    }
    
    //MARK: - Actions
    
    @IBAction func finishButtonPressed(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
        gameBrain?.resetGame()
    }
}
