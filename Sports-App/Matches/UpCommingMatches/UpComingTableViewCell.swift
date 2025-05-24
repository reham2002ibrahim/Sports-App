//
//  UpComingTableViewCell.swift
//  Sports-App
//
//  Created by JETSMobileLabMini11 on 20/05/2025.
//

import UIKit
import Kingfisher

class UpComingTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var noMatchImg: UIImageView!
    @IBOutlet weak var matchesCollectionView: UICollectionView!
    var matches : [Any]?
    var sportsType : MySportType?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        matchesCollectionView.delegate = self
        matchesCollectionView.dataSource = self
        matchesCollectionView.register(UINib(nibName: "UpComingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "upcomingMatchesCollectionCell")
        if let layout = matchesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 16
            layout.minimumInteritemSpacing = 0
        }
        
    }
    
    
    //    override func setSelected(_ selected: Bool, animated: Bool) {
    //        super.setSelected(selected, animated: animated)
    //
    //        // Configure the view for the selected state
    //    }
    
//    func reloading(){
//        matchesCollectionView.reloadData()
//    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return matches?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcomingMatchesCollectionCell", for: indexPath) as! UpComingCollectionViewCell
        switch self.sportsType {
        case .football:
            let fMatches : FMatch = matches?[indexPath.item] as! FMatch
            print(fMatches)
            cell.homeTeamLabel.text = fMatches.eventHomeTeam
            cell.awayTeamLabel.text = fMatches.eventAwayTeam
            if let urlString = fMatches.awayTeamLogo, let url = URL(string: urlString) {
                cell.awayTeamLogo.kf.setImage(with: url)
            } else {
                cell.awayTeamLogo.image = UIImage(named: "teamsPlaceHolder")
            }
            if let urlString = fMatches.homeTeamLogo, let url = URL(string: urlString) {
                cell.homeTeamLogo.kf.setImage(with: url)
            } else {
                cell.homeTeamLogo.image = UIImage(named: "teamsPlaceHolder")
            }
            cell.timeLabel.text = fMatches.eventTime
            cell.dateLabel.text = fMatches.eventDate
            return cell
        case .basketball:
            let bMatches : BFixtureContainer = matches?[indexPath.item] as! BFixtureContainer
            cell.homeTeamLabel.text = bMatches.eventHomeTeam
            cell.awayTeamLabel.text = bMatches.eventAwayTeam
            if let urlString = bMatches.eventAwayTeamLogo, let url = URL(string: urlString) {
                cell.awayTeamLogo.kf.setImage(with: url)
            } else {
                cell.awayTeamLogo.image = UIImage(named: "teamsPlaceHolder")
            }
            if let urlString = bMatches.eventHomeTeamLogo, let url = URL(string: urlString) {
                cell.homeTeamLogo.kf.setImage(with: url)
            } else {
                cell.homeTeamLogo.image = UIImage(named: "teamsPlaceHolder")
            }
            cell.timeLabel.text = bMatches.eventTime
            cell.dateLabel.text = bMatches.eventDate
            return cell
        case .tennis:
            let tMatch : TMatch = matches?[indexPath.item] as! TMatch
            cell.homeTeamLabel.text = tMatch.eventFirstPlayer
            cell.awayTeamLabel.text = tMatch.eventSecondPlayer
            if let urlString = tMatch.eventSecondPlayerLogo, let url = URL(string: urlString) {
                cell.awayTeamLogo.kf.setImage(with: url)
            } else {
                cell.awayTeamLogo.image = UIImage(named: "teamsPlaceHolder")
            }
            if let urlString = tMatch.eventSecondPlayerLogo, let url = URL(string: urlString) {
                cell.homeTeamLogo.kf.setImage(with: url)
            } else {
                cell.homeTeamLogo.image = UIImage(named: "teamsPlaceHolder")
            }
            cell.timeLabel.text = tMatch.eventTime
            cell.dateLabel.text = tMatch.eventDate
            return cell
        case .cricket:
            let cMatches : CMatch = matches?[indexPath.item] as! CMatch
            cell.homeTeamLabel.text = cMatches.eventHomeTeam
            cell.awayTeamLabel.text = cMatches.eventAwayTeam
            if let urlString = cMatches.eventAwayTeamLogo, let url = URL(string: urlString) {
                cell.awayTeamLogo.kf.setImage(with: url)
            } else {
                cell.awayTeamLogo.image = UIImage(named: "teamsPlaceHolder")
            }
            if let urlString = cMatches.eventHomeTeamLogo, let url = URL(string: urlString) {
                cell.homeTeamLogo.kf.setImage(with: url)
            } else {
                cell.homeTeamLogo.image = UIImage(named: "teamsPlaceHolder")
            }
            cell.timeLabel.text = cMatches.eventTime
            cell.dateLabel.text = cMatches.eventDateStart
            return cell
            
            default :
            return cell
            
            
        }
      
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width * 0.7
        let height = collectionView.frame.height * 0.9
        return CGSize(width: width, height: height)
    }
    func reloading() {
        let hasMatches = (matches?.isEmpty == false)
        matchesCollectionView.isHidden = !hasMatches
        noMatchImg.isHidden = hasMatches
        matchesCollectionView.reloadData()
    }
    
}
