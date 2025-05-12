//
//  SplashScreenViewController.swift
//  Sports-App
//
//  Created by JETSMobileLabMini11 on 12/05/2025.
//


import UIKit
import Lottie

class SplashViewController: UIViewController {
    @IBOutlet weak var lottieContainer: UIView!
    private var animationView: LottieAnimationView?

    override func viewDidLoad() {
        super.viewDidLoad()

        animationView = LottieAnimationView(name: "SplashLottie")
        animationView?.frame = lottieContainer.bounds
        animationView?.contentMode = .scaleAspectFit
        animationView?.loopMode = .playOnce
        animationView?.animationSpeed = 1.0

        if let animationView = animationView {
            lottieContainer.addSubview(animationView)
            animationView.play { finished in
               
            }
        }
    }
}

