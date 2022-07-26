//
//  ViewController.swift
//  Alias
//
//  Created by Valery Keplin on 26.07.22.
//

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet weak var externalLogoImage: UIImageView!
    @IBOutlet weak var internalLogoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rotateView(targetView: internalLogoImage)
    }
    

}

//MARK: - Animation logo

extension InitialViewController {
    
    private func rotateView(targetView: UIView, duration: Double = 4) {
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveLinear, animations: {
            targetView.transform = targetView.transform.rotated(by: .pi)
        }) { finished in self.rotateView(targetView: targetView, duration: duration)
        }
    }
}
