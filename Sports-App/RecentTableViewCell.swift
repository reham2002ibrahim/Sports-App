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


//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}
