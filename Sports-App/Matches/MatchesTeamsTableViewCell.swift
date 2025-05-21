//
//  MatchesTeamsTableViewCell.swift
//  Sports-App
//
//  Created by JETSMobileLabMini11 on 21/05/2025.
//

import UIKit

class MatchesTeamsTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    

    @IBOutlet weak var teamsCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        teamsCollectionView.delegate = self
        teamsCollectionView.dataSource = self
        teamsCollectionView.register(UINib(nibName: "MatchesTeamsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "matchesTeamsCollectionViewCell")
        if let layout = teamsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "matchesTeamsCollectionViewCell", for: indexPath) as! MatchesTeamsCollectionViewCell
        cell.teamLogo.image = UIImage(named: "footballonbording")
        cell.teamName.text = "Team Name"
        return cell
    }
    
}
