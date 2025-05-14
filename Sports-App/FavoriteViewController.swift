//
//  FavoriteViewController.swift
//  Sports-App
//
//  Created by MAC on 12/05/2025.
//

import UIKit

class FavoriteViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var favoriteTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteTable.delegate = self
        favoriteTable.dataSource = self
        favoriteTableStyle()
        
        


    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
           // #warning Incomplete implementation, return the number of sections
           return 1
       }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FavoriteTableViewCell
        
        let images = ["footballonbording", "basketballonbording", "tennisonbording", "cricketonbording"]
        let names = ["Football", "Basketball", "Tennis", "Cricket"]
        
        cell.favImg.image = UIImage(named: images[indexPath.row])
        cell.favName.text = names[indexPath.row]

        if indexPath.row % 2 == 0 {
            let bgImageView = UIImageView(image: UIImage(named: "wbackground"))
            bgImageView.contentMode = .scaleAspectFill
            bgImageView.alpha = 0.2
            cell.favName.textColor = .link


            cell.backgroundView = bgImageView
        } else {
            let bgImageView = UIImageView(image: UIImage(named: "myBackgroung"))
            bgImageView.contentMode = .scaleAspectFill
            bgImageView.alpha = 0.9
            cell.backgroundView = bgImageView
            cell.favName.textColor = .white

        }

        return cell
    }


    
//    func tableView(_ tableView: UITableView,didSelectRowAt indexPath:IndexPath    ) {
//        
//        
//        
//        
//    }

    func favoriteTableStyle() {
        favoriteTable.layer.cornerRadius = 25
        favoriteTable.layer.masksToBounds = false
        favoriteTable.layer.shadowColor = UIColor.systemBlue.withAlphaComponent(0.5).cgColor
        favoriteTable.layer.shadowOffset = CGSize(width: 0, height: 0)
        favoriteTable.layer.shadowOpacity = 0.75
        favoriteTable.layer.shadowRadius = 14
        favoriteTable.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        favoriteTable.clipsToBounds = false
    }

}


