//
//  TeamsTableViewCell.swift
//  Sports-App
//
//  Created by MAC on 14/05/2025.
//

import UIKit

class TeamsTableViewCell: UITableViewCell {
    @IBOutlet weak var playerImg: UIImageView!

    @IBOutlet weak var playerTshirt: UILabel!
    @IBOutlet weak var playerName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.contentView.layer.cornerRadius = 20
        self.contentView.layer.masksToBounds = true

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
        self.layer.masksToBounds = false
        
        self.layer.cornerRadius = 20
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
