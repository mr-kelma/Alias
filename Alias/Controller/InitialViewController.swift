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
    @IBOutlet weak var internalLogoImage: UIImageView!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        rotateView(targetView: internalLogoImage)
    }
}
