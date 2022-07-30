//
//  AnimationModel.swift
//  Alias
//
//  Created by Valery Keplin on 29.07.22.
//

import UIKit

//MARK: - Animation for InitialViewController
extension InitialViewController {
    
    func rotateView(targetView: UIView, duration: Double = 4) {
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveLinear, animations: {
            targetView.transform = targetView.transform.rotated(by: .pi)
        }) { finished in self.rotateView(targetView: targetView, duration: duration)
        }
    }
}

//MARK: - Animation for GameViewController
extension GameViewController {
    
    func rotateView(targetView: UIView, duration: Double = 4) {
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveLinear, animations: {
            targetView.transform = targetView.transform.rotated(by: .pi)
        }) { finished in self.rotateView(targetView: targetView, duration: duration)
        }
    }
}
