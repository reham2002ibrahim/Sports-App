//
//  TeamsViewController.swift
//  Sports-App
//
//  Created by MAC on 14/05/2025.
//

import UIKit

class TeamsViewController: UIViewController , UITableViewDelegate, UITableViewDataSource  {

    
    var players :  [Player] = [
        Player (
            playerName: "player1",
            playerTshirt: "11",
            playerImg: UIImage(named: "footballonbording")!) ,
        Player (
            playerName: "player2",
            playerTshirt: "22",
            playerImg: UIImage(named: "footballonbording")!) ,
        Player (
            playerName: "player3",
            playerTshirt: "33",
            playerImg: UIImage(named: "footballonbording")!) ,
        Player (
            playerName: "player4",
            playerTshirt: "44",
            playerImg: UIImage(named: "footballonbording")!)
    ]
        
    @IBOutlet weak var teamName: UIView!
    @IBOutlet weak var teamImg: UIImageView!
    
    @IBOutlet weak var teamTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamTable.delegate = self
        teamTable.dataSource = self
        
        teamTableStyle()
        teamImg.layer.cornerRadius = 25

    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
           // #warning Incomplete implementation, return the number of sections
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

        cell.playerImg.image = player.playerImg
        cell.playerName.text = player.playerName
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


struct Player {
    
    var playerName : String
    var playerTshirt : String
    var playerImg : UIImage

    
    
}
