////
////  TeamsViewController.swift
////  Sports-App
////
////  Created by MAC on 14/05/2025.
////
//
//import UIKit
//
//class TeamsViewController: UIViewController , UITableViewDelegate, UITableViewDataSource , PlayersViewProtocol {
//  
//
//
//    var players: [FPlayer] = []
//      var presenter = PlayersPresenter()
//      var teamId: Int = 96
//    
//        
//    @IBOutlet weak var teamName: UIView!
//    @IBOutlet weak var teamImg: UIImageView!
//    
//    @IBOutlet weak var teamTable: UITableView!
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        teamTable.delegate = self
//        teamTable.dataSource = self
//        presenter.attachView(self)
//        presenter.fetchPlayers(for: teamId)
//        
//        teamTableStyle()
//        teamImg.layer.cornerRadius = 25
//
//    }
//    
//    func displayPlayers(_ players: [FPlayer]) {
//          self.players = players
//          DispatchQueue.main.async {
//              self.teamTable.reloadData()
//          }
//      }
//
//
//    func showError(_ message: String) {
//        print("Error loading players: \(message)")
//    }
//    
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//           // #warning Incomplete implementation, return the number of sections
//           return 1
//       }
//    
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return players.count
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return tableView.frame.height / 4
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TeamsTableViewCell
//        let player = players[indexPath.row]
//
//        cell.playerName.text = player.playerName
//        cell.playerTshirt.text = player.playerNumber
//
//        if let url = URL(string: player.playerImage ?? "myBackground") {
//            DispatchQueue.global().async {
//                if let data = try? Data(contentsOf: url) {
//                    DispatchQueue.main.async {
//                        cell.playerImg.image = UIImage(data: data)
//                    }
//                }
//            }
//        }
//
//        cell.contentView.layer.borderWidth = 0.5
//        cell.contentView.layer.borderColor = UIColor.link.cgColor
//
//        return cell
//    }
//
//    
//    func teamTableStyle() {
//        teamTable.layer.cornerRadius = 25
//        teamTable.layer.masksToBounds = false
//        teamTable.layer.shadowColor = UIColor.systemBlue.withAlphaComponent(0.5).cgColor
//        teamTable.layer.shadowOffset = CGSize(width: 0, height: 0)
//        teamTable.layer.shadowOpacity = 0.75
//        teamTable.layer.shadowRadius = 14
//        teamTable.backgroundColor = UIColor.white.withAlphaComponent(0.8)
//        teamTable.clipsToBounds = false
//    }
//
//}
//
