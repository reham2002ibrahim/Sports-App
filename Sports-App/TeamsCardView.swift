//
//  TeamsCardView.swift
//  Sports-App
//
//  Created by MAC on 14/05/2025.
//

import UIKit

class TeamsCardView: UIView {

        override func awakeFromNib() {
            super.awakeFromNib()
            setupCard()
        }

    func setupCard() {
        self.layer.cornerRadius = 25
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.systemBlue.withAlphaComponent(0.5).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 14
        self.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        self.clipsToBounds = false

    }
}



