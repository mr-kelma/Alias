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
    @IBOutlet weak var correctButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    
    //MARK: - Properties
    var gameBrain: GameBrain = GameBrain()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    
    
    
    
    
    
    
    //MARK: - Setup views
    func setupViews() {
        for button in [correctButton, skipButton] {
            button?.layer.cornerRadius = 10
        }
        navigationItem.hidesBackButton = true
        outButton.tintColor = .white
    }
    
    //MARK: - Actions
    @IBAction func outButtonPressed(_ sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func correctButtonPressed(_ sender: UIButton) {
        playSound(resource: sender.titleLabel?.text ?? "ПРАВИЛЬНО")
        
    }
    
    @IBAction func skipButtonPressed(_ sender: UIButton) {
        playSound(resource: sender.titleLabel?.text ?? "ПРОПУСТИТЬ")
        
    }
    
    
    
    
}
