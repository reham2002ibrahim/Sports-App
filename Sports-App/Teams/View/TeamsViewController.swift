import UIKit

class TeamsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PlayersViewProtocol {

    var players: [Any] = []
    var presenter = PlayersPresenter()
    var teamId: Int = 0
    var sportType : Int = 0

   // var sportType: MySportType = .football
    var selectedTeamLogo: String?
    var selectedTeamName: String?

    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamImg: UIImageView!
    @IBOutlet weak var teamTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        teamTable.delegate = self
        teamTable.dataSource = self
        
       
        
        presenter.attachView(self)
        presenter
            .fetchPlayers(
                teamId: teamId,
                sportType: sportType
            )
        teamTableStyle()
        teamImg.layer.cornerRadius = 25

        // Set team name if passed from previous VC
        if let name = selectedTeamName {
            teamName.text = name
        }
        // Set team logo if passed from previous VC
        if let logo = selectedTeamLogo, let url = URL(string: logo) {
            URLSession.shared.dataTask(with: url) { data, _, _ in
                if let data = data {
                    DispatchQueue.main.async {
                        self.teamImg.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
    }

    func displayPlayers(_ players: [Any]) {
        self.players = players
        DispatchQueue.main.async {
            self.teamTable.reloadData()
        }
    }

    func showError(_ message: String) {
        let alert = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TeamsTableViewCell
        let player = players[indexPath.row]

        if let footballPlayer = player as? FPlayer {
            cell.playerName.text = footballPlayer.playerName
            cell.playerTshirt.text = footballPlayer.playerNumber
            if let img = footballPlayer.playerImage, let url = URL(string: img) {
                URLSession.shared.dataTask(with: url) { data, _, _ in
                    if let data = data {
                        DispatchQueue.main.async {
                            cell.playerImg.image = UIImage(data: data)
                        }
                    }
                }.resume()
            } else {
                cell.playerImg.image = UIImage(named: "leaguePlaceHolder")
            }
        } else if let cricketPlayer = player as? CPlayer {
            cell.playerName.text = cricketPlayer.playerName
            cell.playerTshirt.text = cricketPlayer.playerNumber
            if let img = cricketPlayer.playerImage, let url = URL(string: img) {
                URLSession.shared.dataTask(with: url) { data, _, _ in
                    if let data = data {
                        DispatchQueue.main.async {
                            cell.playerImg.image = UIImage(data: data)
                        }
                    }
                }.resume()
            } else {
                cell.playerImg.image = UIImage(named: "leaguePlaceHolder")
            }
        }
        // Add basketball player logic if your API supports it

        cell.contentView.layer.borderWidth = 0.5
        cell.contentView.layer.borderColor = UIColor.link.cgColor

        return cell
    }

    func teamTableStyle() {
        teamTable.layer.cornerRadius = 25
        teamTable.layer.masksToBounds = false
        teamTable.layer.shadowColor = UIColor.systemBlue.withAlphaComponent(0.5).cgColor
        teamTable.layer.shadowOffset = CGSize(width: 0, height: 0)
        teamTable.layer.shadowOpacity = 0.75
        teamTable.layer.shadowRadius = 14
        teamTable.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        teamTable.clipsToBounds = false
    }
}

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
//    var players: [Any] = []
//      var presenter = PlayersPresenter()
//      var teamId: Int = 0
//      var sportType: MySportType = .football
//      var selectedTeamLogo: String?
//      var selectedTeamName: String?
//        
//    @IBOutlet weak var teamName: UILabel!
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
//        
//         presenter.fetchPlayers(teamId: teamId, sportType: sportType)
//         teamTableStyle()
//         teamImg.layer.cornerRadius = 25
//        
//        
//         // Optionally set team name/logo if passed from previous VC
//         if let name = teamName { teamName.text = selectedTeamName }
//         if let logo = teamImg, let url = URL(string: logo) {
//             URLSession.shared.dataTask(with: url) { data, _, _ in
//                 if let data = data {
//                     DispatchQueue.main.async {
//                         self.teamImg.image = UIImage(data: data)
//                     }
//                 }
//             }.resume()
//         }
//        teamImg.layer.cornerRadius = 25
//
//    }
//    
//    func displayPlayers(_ players: [Any]) {
//        self.players = players
//        DispatchQueue.main.async {
//            self.teamTable.reloadData()
//        }
//    }
//
//
//    func showError(_ message: String) {
//        let alert = UIAlertController(
//                 title: "Error",
//                 message: message,
//                 preferredStyle: .alert
//             )
//             alert.addAction(UIAlertAction(title: "OK", style: .default))
//             present(alert, animated: true)
//    }
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
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//           let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TeamsTableViewCell
//           let player = players[indexPath.row]
//
//           if let footballPlayer = player as? FPlayer {
//               cell.playerName.text = footballPlayer.playerName
//               cell.playerTshirt.text = footballPlayer.playerNumber
//               if let img = footballPlayer.playerImage, let url = URL(string: img) {
//                   URLSession.shared.dataTask(with: url) { data, _, _ in
//                       if let data = data {
//                           DispatchQueue.main.async {
//                               cell.playerImg.image = UIImage(data: data)
//                           }
//                       }
//                   }.resume()
//               } else {
//                   cell.playerImg.image = UIImage(named: "leaguePlaceHolder")
//               }
//           } else if let cricketPlayer = player as? CPlayer {
//               cell.playerName.text = cricketPlayer.playerName
//               cell.playerTshirt.text = cricketPlayer.playerNumber
//               if let img = cricketPlayer.playerImage, let url = URL(string: img) {
//                   URLSession.shared.dataTask(with: url) { data, _, _ in
//                       if let data = data {
//                           DispatchQueue.main.async {
//                               cell.playerImg.image = UIImage(data: data)
//                           }
//                       }
//                   }.resume()
//               } else {
//                   cell.playerImg.image = UIImage(named: "leaguePlaceHolder")
//               }
//           }
//           // Add basketball player logic if your API supports it
//
//           cell.contentView.layer.borderWidth = 0.5
//           cell.contentView.layer.borderColor = UIColor.link.cgColor
//
//           return cell
//       }
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TeamsTableViewCell
////        let player = players[indexPath.row]
////
////        cell.playerName.text = player.playerName
////        cell.playerTshirt.text = player.playerNumber
////
////        if let url = URL(string: player.playerImage ?? "myBackground") {
////            DispatchQueue.global().async {
////                if let data = try? Data(contentsOf: url) {
////                    DispatchQueue.main.async {
////                        cell.playerImg.image = UIImage(data: data)
////                    }
////                }
////            }
////        }
////
////        cell.contentView.layer.borderWidth = 0.5
////        cell.contentView.layer.borderColor = UIColor.link.cgColor
////
////        return cell
////    }
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
