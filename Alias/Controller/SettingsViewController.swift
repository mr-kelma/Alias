//
//  SettingsViewController.swift
//  Alias
//
//  Created by Valery Keplin on 26.07.22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var countTeam: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var nature: UIButton!
    @IBOutlet weak var sport: UIButton!
    @IBOutlet weak var geo: UIButton!
    @IBOutlet weak var liter: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepper.value = 0
        stepper.minimumValue = 0
        stepper.backgroundColor = .systemMint
        stepper.tintColor = .orange
        nature.tintColor = .orange
        sport.tintColor = .orange
        geo.tintColor = .orange
        liter.tintColor = .orange

        
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        countTeam.text = String(Int(sender.value))
    }
    
    
    @IBAction func pressedGategory(_ sender: UIButton) {
        sender.tintColor = .systemMint
    }
}
