//
//  LeaguesCellTableViewCell.swift
//  Sports-App
//
//  Created by JETSMobileLabMini11 on 18/05/2025.
//

import UIKit

class LeaguesCellTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueImage: UIImageView!
    @IBOutlet weak var leagueTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
