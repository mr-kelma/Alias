//
//  ResultOfRoundViewController.swift
//  Alias
//
//  Created by Valery Keplin on 26.07.22.
//

import UIKit

class ResultOfRoundViewController: UIViewController {

    //MARK: - Views
    @IBOutlet weak var currentResultLabel: UILabel!
    @IBOutlet weak var nextTeamLabel: UILabel!
    @IBOutlet weak var outButton: UIBarButtonItem!
    
    //MARK: - Properties
    var gameBrain: GameBrain?
    var goBack: (()-> ())?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        startViews()
    }
     
    //MARK: - Setup views
    func startViews() {
        navigationItem.hidesBackButton = true
        outButton.tintColor = .white
        currentResultLabel.text = "\(gameBrain?.selectedTeam?.name ?? "Команда 1") набрала: \(gameBrain?.selectedTeam?.score ?? 0) очков"
        nextTeamLabel.text = "Следующая играет: \(gameBrain?.getNextTeamName() ?? "Команда 2")"
    }
    
    //MARK: - Actions
    @IBAction func nextRoundPressed(_ sender: Any) {
        goBack?()
        navigationController?.popViewController(animated: true)
    }
}
