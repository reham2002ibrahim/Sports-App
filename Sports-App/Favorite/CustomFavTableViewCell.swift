//
//  CustomFavTableViewCell.swift
//  Sports-App
//
//  Created by MAC on 19/05/2025.
//

import UIKit

class CustomFavTableViewCell: UITableViewCell {

    @IBOutlet weak var favName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.layer.cornerRadius = 18
        contentView.layer.borderWidth = 1.2
        contentView.layer.borderColor = UIColor.systemBlue.withAlphaComponent(0.3).cgColor
        contentView.layer.masksToBounds = true
        backgroundColor = .clear
        
        layer.shadowColor = UIColor.systemBlue.withAlphaComponent(0.18).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 10
        layer.masksToBounds = false
        
        favImg.layer.cornerRadius = favImg.frame.height / 2
        favImg.layer.masksToBounds = true
        favImg.layer.borderWidth = 1
        favImg.layer.borderColor = UIColor.systemBlue.withAlphaComponent(0.2).cgColor
        
        favName.font = UIFont.boldSystemFont(ofSize: 18)
        favName.textColor = UIColor.systemBlue
    }
    @IBOutlet weak var favImg: UIImageView!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
