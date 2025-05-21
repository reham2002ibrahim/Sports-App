//
//  UpComingCollectionViewCell.swift
//  Sports-App
//
//  Created by JETSMobileLabMini11 on 20/05/2025.
//

import UIKit

class UpComingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var homeTeamLogo: UIImageView!
    
    @IBOutlet weak var awayTeamLogo: UIImageView!
    
    @IBOutlet weak var homeTeamLabel: UILabel!
    
    @IBOutlet weak var awayTeamLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 12
            layer.masksToBounds = false
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOpacity = 0.2
            layer.shadowOffset = CGSize(width: 0, height: 4)
            layer.shadowRadius = 6

            contentView.layer.cornerRadius = 12
            contentView.layer.masksToBounds = true
    }

}
