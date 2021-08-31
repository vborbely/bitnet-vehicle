//
//  SplashViewController.swift
//  BitnetVehicle
//
//  Created by Borbély Viktor on 2021. 08. 30..
//

import UIKit

class SplashViewController: UIViewController {
    let transitionDelegate: UIViewControllerTransitioningDelegate = TransitionDelegate()
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        slideToNext()
    }
    
    private func slideToNext() {
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.Timings.Transitions.splashDelayToNext) {
            let secondView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: ManufacturerListViewController.self))
            secondView.transitioningDelegate = self.transitionDelegate
            self.present(secondView, animated: true, completion: nil)
        }
    }
    
}
