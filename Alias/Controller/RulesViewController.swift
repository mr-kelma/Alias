//
//  RulesViewController.swift
//  Alias
//
//  Created by Valery Keplin on 26.07.22.
//

import UIKit

class RulesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func ButtonPerehod(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToAction", sender: self)
    }
    

}
