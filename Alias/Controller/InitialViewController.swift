//
//  ViewController.swift
//  Alias
//
//  Created by Valery Keplin on 26.07.22.
//

import UIKit

class InitialViewController: UIViewController {
    
    //MARK: - Views
    @IBOutlet weak var externalLogoImage: UIImageView!
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var rulesOfGameButton: UIButton!
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    //MARK: - Setup views
    func setupViews() {
        for button in [newGameButton, rulesOfGameButton] {
            button?.layer.cornerRadius = 10
        }
    }
}
