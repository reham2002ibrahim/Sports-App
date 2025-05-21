//
//  RecentTableViewCell.swift
//  Sports-App
//
//  Created by JETSMobileLabMini11 on 20/05/2025.
//

import UIKit

class RecentTableViewCell: UITableViewCell {

    @IBOutlet weak var awayTeamName: UILabel!
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var awayTeamLogo: UIImageView!
    @IBOutlet weak var homeTeamLogo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = UIColor.white.withAlphaComponent(0.5)
        contentView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
    }
    
    func configureWithFootballMatch(match: FMatch) {
        homeTeamName.text = match.eventHomeTeam
        awayTeamName.text = match.eventAwayTeam
        score.text = match.eventFtResult ?? "-"
        dateLabel.text = match.eventDate
        timeLabel.text = match.eventTime

        if let homeLogo = match.homeTeamLogo, let url = URL(string: homeLogo) {
            homeTeamLogo.kf.setImage(with: url)
        } else {
            homeTeamLogo.image = UIImage(named: "teamsPlaceHolder")
        }

        if let awayLogo = match.awayTeamLogo, let url = URL(string: awayLogo) {
            awayTeamLogo.kf.setImage(with: url)
        } else {
            awayTeamLogo.image = UIImage(named: "teamsPlaceHolder")
        }
    }

    func configureWithBasketballMatch(match: BFixtureContainer) {
        homeTeamName.text = match.eventHomeTeam
        awayTeamName.text = match.eventAwayTeam
        score.text = match.eventFinalResult
        dateLabel.text = match.eventDate
        timeLabel.text = match.eventTime

        if let homeLogo = match.eventHomeTeamLogo, let url = URL(string: homeLogo) {
            homeTeamLogo.kf.setImage(with: url)
        } else {
            homeTeamLogo.image = UIImage(named: "teamsPlaceHolder")
        }

        if let awayLogo = match.eventAwayTeamLogo, let url = URL(string: awayLogo) {
            awayTeamLogo.kf.setImage(with: url)
        } else {
            awayTeamLogo.image = UIImage(named: "teamsPlaceHolder")
        }
    }
    
    func configureWithTennisMatch(match: TMatch) {
        homeTeamName.text = match.eventFirstPlayer
        awayTeamName.text = match.eventSecondPlayer
        score.text = match.eventFinalResult
        dateLabel.text = match.eventDate
        timeLabel.text = match.eventTime

        if let firstPlayerLogo = match.eventFirstPlayerLogo, let url = URL(string: firstPlayerLogo) {
            homeTeamLogo.kf.setImage(with: url)
        } else {
            homeTeamLogo.image = UIImage(named: "teamsPlaceHolder")
        }

        if let secondPlayerLogo = match.eventSecondPlayerLogo, let url = URL(string: secondPlayerLogo) {
            awayTeamLogo.kf.setImage(with: url)
        } else {
            awayTeamLogo.image = UIImage(named: "teamsPlaceHolder")
        }
    }

    func configureWithCricketMatch(match: CMatch) {
        homeTeamName.text = match.eventHomeTeam
        awayTeamName.text = match.eventAwayTeam
        score.text = "\(match.eventHomeFinalResult) - \(match.eventAwayFinalResult)"
        dateLabel.text = match.eventDateStart
        timeLabel.text = match.eventTime

        if let homeLogo = match.eventHomeTeamLogo, let url = URL(string: homeLogo) {
            homeTeamLogo.kf.setImage(with: url)
        } else {
            homeTeamLogo.image = UIImage(named: "teamsPlaceHolder")
        }

        if let awayLogo = match.eventAwayTeamLogo, let url = URL(string: awayLogo) {
            awayTeamLogo.kf.setImage(with: url)
        } else {
            awayTeamLogo.image = UIImage(named: "teamsPlaceHolder")
        }
    }


//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}
