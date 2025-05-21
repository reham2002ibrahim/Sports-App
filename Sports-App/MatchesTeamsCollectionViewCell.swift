//
//  MatchesTeamsCollectionViewCell.swift
//  Sports-App
//
//  Created by JETSMobileLabMini11 on 21/05/2025.
//

import UIKit

class MatchesTeamsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamLogo: UIImageView!
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
