//
//  MatchesTeamsTableViewCell.swift
//  Sports-App
//
//  Created by JETSMobileLabMini11 on 21/05/2025.
//

import UIKit

class MatchesTeamsTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    var data: [Any] = []
    var sportType: MySportType = .football
    var onTeamSelected: ((Int, String?, String?, MySportType) -> Void)?

    
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        teamsCollectionView.delegate = self
        teamsCollectionView.dataSource = self
        teamsCollectionView.register(UINib(nibName: "MatchesTeamsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "matchesTeamsCollectionViewCell")
        if let layout = teamsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "matchesTeamsCollectionViewCell", for: indexPath) as! MatchesTeamsCollectionViewCell
        let item = data[indexPath.row]
        
        switch sportType {
        case .tennis:
            if let player = item as? TPlayer {
                cell.teamName.text = player.playerName
                loadImage(from: player.playerImage ?? "", into: cell.teamLogo)
            }
        case .football:
            if let team = item as? FTeam {
                cell.teamName.text = team.teamName
                loadImage(from: team.teamLogo ?? "", into: cell.teamLogo)
            }
        case .basketball:
            if let team = item as? BTeam {
                cell.teamName.text = team.teamName
                loadImage(from: team.teamLogo ?? "", into: cell.teamLogo)
            }
        case .cricket:
            if let team = item as? CTeam {
                print("\n\n\n\n\n \(team.teamName)")
                cell.teamName.text = team.teamName
                loadImage(from: team.teamLogo ?? "", into: cell.teamLogo)
            }
        }
        return cell
    }
    private func loadImage(from urlString: String, into imageView: UIImageView) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    imageView.image = image
                }
            }
        }.resume()
        
    }
    func reloading(){
        teamsCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let item = data[indexPath.row]
            var teamId: Int?
            var teamName: String?
            var teamLogo: String?
            
            switch sportType {
            case .football:
                if let team = item as? FTeam {
                    print(team.teamKey)
                    print("\n")
                    print("\n")

                    print("\n")

                    print("\n")

                    
                    teamId = team.teamKey ?? 96
                    teamName = team.teamName
                    teamLogo = team.teamLogo
                }
            case .basketball:
                if let team = item as? BTeam {
                    teamId = team.teamKey
                    teamName = team.teamName
                    teamLogo = team.teamLogo
                }
            case .cricket:
                if let team = item as? CTeam {
                    teamId = team.teamKey
                    teamName = team.teamName
                    teamLogo = team.teamLogo
                }
            case .tennis:
                if let player = item as? TPlayer {
                    teamId = player.playerKey
                    teamName = player.playerName
                    teamLogo = player.playerImage
                }
            }
            
            if let teamId = teamId {
                onTeamSelected?(teamId, teamName, teamLogo, sportType)
            }
        }
    }
    
    
    
    ////
    ////  MatchesTeamsTableViewCell.swift
    ////  Sports-App
    ////
    ////  Created by JETSMobileLabMini11 on 21/05/2025.
    ////
    //
    //import UIKit
    //
    //class MatchesTeamsTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    //
    //
    //
    //    @IBOutlet weak var teamsCollectionView: UICollectionView!
    //    override func awakeFromNib() {
    //        super.awakeFromNib()
    //        teamsCollectionView.delegate = self
    //        teamsCollectionView.dataSource = self
    //        teamsCollectionView.register(UINib(nibName: "MatchesTeamsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "matchesTeamsCollectionViewCell")
    //        if let layout = teamsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
    //            layout.scrollDirection = .horizontal
    //        }
    //    }
    //
    //    override func setSelected(_ selected: Bool, animated: Bool) {
    //        super.setSelected(selected, animated: animated)
    //
    //        // Configure the view for the selected state
    //    }
    //
    //    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //        return 10
    //    }
    //
    //    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "matchesTeamsCollectionViewCell", for: indexPath) as! MatchesTeamsCollectionViewCell
    //        cell.teamLogo.image = UIImage(named: "footballonbording")
    //        cell.teamName.text = "Team Name"
    //        return cell
    //    }
    //

