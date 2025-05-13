//
//  OnboardingPageViewController.swift
//  Sports-App
//
//  Created by MAC on 12/05/2025.
//

import UIKit

class OnboardingPageViewController: UIPageViewController  , UIPageViewControllerDelegate,
                                    UIPageViewControllerDataSource {
    
    
    
    var navController : UINavigationController!
    var arr: [UIViewController] = []
    var pageControl = UIPageControl()

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentView = arr.firstIndex(of: viewController) else {
            
            return nil ;
        }
        
        
        if   currentView-1 >= 0 {
            
            return arr[currentView-1]
        }
        return nil

     }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let currentIndex = arr.firstIndex(of: viewController) else {
                return nil
            }

            if currentIndex < arr.count - 1 {
                return arr[currentIndex + 1]
            } else {
                goToHomeScreen()
                UserDefaults.standard.set(true, forKey: "userLogged")
                return nil
            }
        }
    
    func goToHomeScreen() {
        let storyboard = UIStoryboard(name: "RehamStoryboard", bundle: nil)
        
        if let tabBar = storyboard.instantiateViewController(withIdentifier: "tabBar") as? UITabBarController {
            
            if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                sceneDelegate.window?.rootViewController = tabBar
                sceneDelegate.window?.makeKeyAndVisible()
            } else {
                self.present(tabBar, animated: true, completion: nil)
            }
        }
    }

            
            
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

   
        self.delegate   = self
        self.dataSource = self
        
        self.navigationItem.hidesBackButton = true
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false

        
        let v1  = self.storyboard?.instantiateViewController(withIdentifier: "on1")
        let v2  = self.storyboard?.instantiateViewController(withIdentifier: "on2")
        let v3  = self.storyboard?.instantiateViewController(withIdentifier: "on3")
        let v4  = self.storyboard?.instantiateViewController(withIdentifier: "on4")
        
        arr.append(v1!)
        arr.append(v2!)
        arr.append(v3!)
        arr.append(v4!)

        if let v1 = arr.first {
            setViewControllers(
                [v1],
                direction: .forward,
                animated: true ,
                completion: nil
            )
            
            
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool,
                              previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
          if completed, let currentVC = viewControllers?.first, let index = arr.firstIndex(of: currentVC) {
              pageControl.currentPage = index
          }
      }
    
}
