//
//  UpComingTableViewCell.swift
//  Sports-App
//
//  Created by JETSMobileLabMini11 on 20/05/2025.
//

import UIKit

class UpComingTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var matchesCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        matchesCollectionView.delegate = self
        matchesCollectionView.dataSource = self
        matchesCollectionView.register(UINib(nibName: "UpComingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "upcomingMatchesCollectionCell")
        if let layout = matchesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 16
            layout.minimumInteritemSpacing = 0
        }
        
    }
    
    
    //    override func setSelected(_ selected: Bool, animated: Bool) {
    //        super.setSelected(selected, animated: animated)
    //
    //        // Configure the view for the selected state
    //    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcomingMatchesCollectionCell", for: indexPath) as! UpComingCollectionViewCell
        cell.homeTeamLabel.text = "Team A"
        cell.awayTeamLabel.text = "Team B"
        cell.awayTeamLogo.image = UIImage(named: "footballonbording")
        cell.homeTeamLogo.image = UIImage(named: "footballonbording")
        cell.timeLabel.text = "12:00 PM"
        cell.dateLabel.text = "20 May 2025"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width * 0.7
        let height = collectionView.frame.height * 0.9
        return CGSize(width: width, height: height)
    }
    
}
