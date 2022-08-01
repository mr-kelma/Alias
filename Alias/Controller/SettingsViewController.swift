//
//  SettingsViewController.swift
//  Alias
//
//  Created by Valery Keplin on 26.07.22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //MARK: - Views
    @IBOutlet weak var countTeam: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var natureButton: UIButton!
    @IBOutlet weak var sportButton: UIButton!
    @IBOutlet weak var geoButton: UIButton!
    @IBOutlet weak var literButton: UIButton!
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    //MARK: - Properties
    var gameBrain: GameBrain = GameBrain()
    var teams: [Team] = []
    var selectedCategory: String = "Природа"
    var wordsOfCategory: Category = Category.nature
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    //MARK: - Setup views
    func setupViews() {
        for button in [natureButton, sportButton, geoButton, literButton] {
            button?.layer.cornerRadius = 10
        }
        stepper.value = 0
        stepper.minimumValue = 2
        stepper.maximumValue = 5
        for button in [natureButton, sportButton, geoButton, literButton] {
            button?.tintColor = .orange
        }
    }
    
    //MARK: - Actions
    @IBAction func stepperAction(_ sender: UIStepper) {
        countTeam.text = String(Int(sender.value))
    }

    //Assign selectedCategory text of buttons and change background of buttons
    @IBAction func pressedGategory(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text else {
            return
        }
        selectedCategory = text

        for button in [natureButton, sportButton, geoButton, literButton] {
            if selectedCategory == button?.titleLabel?.text{
                button?.tintColor = #colorLiteral(red: 0.8885846397, green: 0.4469456078, blue: 0.002523117625, alpha: 1)
            } else {
                button?.tintColor = .orange
            }
        }
        
        if selectedCategory == "Природа" {
            wordsOfCategory = .nature
        } else if selectedCategory == "Спорт" {
            wordsOfCategory = .sport
        } else if selectedCategory == "География" {
            wordsOfCategory = .geo
        } else if selectedCategory == "Литература" {
            wordsOfCategory = .liter
        }
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        for i in 1...Int(stepper.value){
            teams.append(Team(name: "Команда \(i)"))
        }
        gameBrain.teams = teams
        gameBrain.wordsOfCategory = wordsOfCategory
    }
}
