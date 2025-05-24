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
        
        // Card style for the cell
        contentView.layer.cornerRadius = 18
        contentView.layer.borderWidth = 1.2
        contentView.layer.borderColor = UIColor.systemBlue.withAlphaComponent(0.3).cgColor
        contentView.layer.masksToBounds = true
        backgroundColor = .clear
        
        // Shadow on the cell (not contentView)
        layer.shadowColor = UIColor.systemBlue.withAlphaComponent(0.18).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 10
        layer.masksToBounds = false
        
        // League image rounded
        leagueImage.layer.cornerRadius = leagueImage.frame.height / 2
        leagueImage.layer.masksToBounds = true
        leagueImage.layer.borderWidth = 1
        leagueImage.layer.borderColor = UIColor.systemBlue.withAlphaComponent(0.2).cgColor
        
        // League title style
        leagueTitle.font = UIFont.boldSystemFont(ofSize: 18)
        leagueTitle.textColor = UIColor.systemBlue
        
        // Fav icon tint
        favBtn.tintColor = .link
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        
//        favBtn.isUserInteractionEnabled = true
//        let clickBtn = UITapGestureRecognizer(target: self, action: #selector(favBtnTapped))
//        favBtn.addGestureRecognizer(clickBtn)
//        
//        
//        self.contentView.layer.cornerRadius = 20
//        self.contentView.layer.masksToBounds = true
//        
//
//    }

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
