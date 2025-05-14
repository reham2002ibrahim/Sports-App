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
    private var navController : UINavigationController!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        animationView = LottieAnimationView(name: "SplashLottie")
        animationView?.frame = lottieContainer.bounds
        animationView?.contentMode = .scaleAspectFit
        animationView?.loopMode = .playOnce
        animationView?.animationSpeed = 1.0
        if UIDevice.current.userInterfaceIdiom == .pad {
            animationView?.transform = CGAffineTransform(scaleX: 2, y: 1.2)
        } else {
            animationView?.transform = CGAffineTransform(scaleX:1.02  , y: 1.02 )
        }
        animationView?.autoresizingMask = [.flexibleWidth,.flexibleHeight]

       
        if let animationView = animationView {
            lottieContainer.addSubview(animationView)
            animationView.play { [weak self] finished in
                if finished {
                    let storyboard = UIStoryboard(name: "RehamStoryboard", bundle: nil)
                    let userLogged = UserDefaults.standard.bool(forKey: "userLogged")
                    if !userLogged {
                        if let rehamVC = storyboard.instantiateViewController(withIdentifier: "OnboardingPageViewController") as? OnboardingPageViewController {
                            
                            rehamVC.navController = self?.navController
                            self?.navController?.pushViewController(rehamVC, animated: true)
                        }
                    }
                    else { 
                                                
                        if let tabBar = storyboard.instantiateViewController(withIdentifier: "tabBar") as? UITabBarController {
                            
                            if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                                sceneDelegate.window?.rootViewController = tabBar
                                sceneDelegate.window?.makeKeyAndVisible()
                            }
                        }
                        
                        
                    }
                }
            }
        }
    }
    func inject(navController:UINavigationController){
        self.navController = navController
        
    }
}

