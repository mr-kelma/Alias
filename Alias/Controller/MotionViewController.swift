//
//  MotionViewController.swift
//  Alias
//
//  Created by Valery Keplin on 26.07.22.
//

import UIKit
import AVFoundation

class MotionViewController: UIViewController {

    @IBOutlet weak var nameTeam: UILabel!
    @IBOutlet weak var scoreTeam: UILabel!
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var questionAction: UILabel!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var wrongButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startViews()
    }
    
    func startViews() {
        for button in [rightButton, wrongButton] {
            button?.layer.cornerRadius = 10
        }
    
    }
    @IBAction func pressedRightButton(_ sender: UIButton) {
        playSound(resource: "ПРАВИЛЬНО")
    }
    
    @IBAction func pressedWrongButton(_ sender: UIButton) {
        playSound(resource: "ПРОПУСТИТЬ")
    }
}
