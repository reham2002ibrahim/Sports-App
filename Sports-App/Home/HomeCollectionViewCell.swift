//
//  HomeCollectionViewCell.swift
//  Sports-App
//
//  Created by MAC on 12/05/2025.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var sportName: UILabel!

    @IBOutlet weak var sportImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellStyle()
    }

    private func cellStyle() {
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = false

        self.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor

        self.layer.shadowColor = UIColor.systemBlue.withAlphaComponent(0.4).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 6)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 10

        self.backgroundColor = UIColor.white.withAlphaComponent(0.08)

        sportImg.layer.cornerRadius = 14
        sportImg.clipsToBounds = true

    }
   }
