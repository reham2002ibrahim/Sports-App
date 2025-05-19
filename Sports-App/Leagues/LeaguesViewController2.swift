////
////  LeaguesViewCViewController.swift
////  Sports-App
////
////  Created by MAC on 17/05/2025.
////
//
//
//import Foundation
//import UIKit
//
//
//protocol LeaguesViewProtocol: AnyObject {
//    func displayLeagues(_ leagues: [FLeague])
//    func showError(_ message: String)
//}
//
//
//
//class LeaguesViewController: UIViewController, LeaguesViewProtocol {
//    @IBOutlet weak var myLabel: UILabel!
//
//
//    let presenter = LeaguesPresenter()
//
//       override func viewDidLoad() {
//           super.viewDidLoad()
//           presenter.attachView(MyController: self)
//           presenter.fetchLeagues(for: .football)
//       }
//
//       func displayLeagues(_ leagues: [FLeague]) {
//           leagues.forEach { league in
//               print(" \(league.leagueName)")
//           }
//           
//           if let firstLeague = leagues.first {
//               myLabel.text = firstLeague.leagueName
//           }
//       }
//
//       func showError(_ message: String) {
//           print("Error: \(message)")
//       }
//   }
