//
//  HomeViewController.swift
//  Sports-App
//
//  Created by MAC on 12/05/2025.
//

import UIKit


private let reuseIdentifier = "cell"

class HomeViewController: UIViewController,  UICollectionViewDelegateFlowLayout, UICollectionViewDataSource  {
    
    let sports: [(name: String, imageName: String)] = [
        ("Football", "footballonbording"),
        ("Basketball", "basketballonbording"),
        ("Tennis", "tennisonbording"),
        ("Cricket", "cricketonbording")
    ]

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HomeCollectionViewCell

        let sport = sports[indexPath.item]
        cell.sportName.text = sport.name
        cell.sportImg.image = UIImage(named: sport.imageName)


        return cell
    }


    
    
    
    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var sportsLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionViewStyle()


    
    }
    


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 10
        let width = (collectionView.bounds.width - spacing * 3) / 2
        return CGSize(width: width, height: 250)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    

    func collectionViewStyle() {
        collectionView.layer.cornerRadius = 25
        collectionView.layer.masksToBounds = false
        collectionView.layer.shadowColor = UIColor.systemBlue.withAlphaComponent(0.5).cgColor
        collectionView.layer.shadowOffset = CGSize(width: 0, height: 0)
        collectionView.layer.shadowOpacity = 0.75
        collectionView.layer.shadowRadius = 14
        collectionView.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        collectionView.clipsToBounds = false
    }




}


