//
//  LeaguesCellTableViewCell.swift
//  Sports-App
//
//  Created by JETSMobileLabMini11 on 18/05/2025.
//

import UIKit
import UIView_Shimmer

class LeaguesCellTableViewCell: UITableViewCell , ShimmeringViewProtocol{

    @IBOutlet weak var favBtn: UIImageView!
    @IBOutlet weak var leagueImage: UIImageView!
    @IBOutlet weak var leagueTitle: UILabel!
    var isFavSelected = false
    var onFavTapped: (() -> Void)?
    
    var shimmeringAnimatedItems: [UIView] {
           [leagueImage, leagueTitle, favBtn]
       }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        favBtn.isUserInteractionEnabled = true
        let clickBtn = UITapGestureRecognizer(target: self, action: #selector(favBtnTapped))
        favBtn.addGestureRecognizer(clickBtn)
        
        
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
    
    
    func renderCell(with name: String, imageUrl: String?) {
        leagueTitle.text = name
        leagueImage.image = UIImage(named: "leaguePlaceHolder")
        if let imageUrl = imageUrl, let url = URL(string: imageUrl) {
            URLSession.shared.dataTask(with: url) { data, _, _ in
                if let data = data {
                    DispatchQueue.main.async {
                        self.leagueImage.image = UIImage(data: data)
                    }
                }
            }.resume()
        } 
    }
    
    func updateFavIcon(isFavorite: Bool) {
        isFavSelected = isFavorite
        favBtn.tintColor = isFavorite ? .systemPink : .link
    }
    
    
    @objc private func favBtnTapped() {
        onFavTapped?()
    }
    
}
