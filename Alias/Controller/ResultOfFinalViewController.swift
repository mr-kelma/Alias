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
    }
    
    //MARK: - Actions
    @IBAction func outButtonPressed(_ sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewController(animated: true)
        gameBrain?.resetGame()
    }
    
    @IBAction func finishButtonPressed(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
        gameBrain?.resetGame()
    }
}
