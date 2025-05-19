//
//  FavoriteViewController.swift
//  Sports-App
//
//  Created by MAC on 19/05/2025.
//

import UIKit
private let reuseIdentifier = "cell"

class FavoriteViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var mySegment: UISegmentedControl!

    @IBOutlet weak var favoriteTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteTable.delegate = self
        favoriteTable.dataSource = self
        favoriteTableStyle()

        
        
        let nib = UINib(nibName: "CustomFavTableViewCell", bundle: nil)
        self.favoriteTable!
            .register(nib, forCellReuseIdentifier: reuseIdentifier)
        

        // Do any additional setup after loading the view.
    }
    
    //    CoreDataService.shared.addLeague(to: "FootballTable", id: 1, name: "Premier League", img: "premier.png")
    
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        favoriteTable.reloadData()
    }


    func numberOfSections(in tableView: UITableView) -> Int {
           // #warning Incomplete implementation, return the number of sections
           return 1
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tableName = entityNameForSelectedSegment()
        return CoreDataService.shared.getAllLeagues(from: tableName).count
    }


    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 4 - 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath
        ) as! CustomFavTableViewCell
        

        let tableName = entityNameForSelectedSegment()
            let leagues = CoreDataService.shared.getAllLeagues(from: tableName)
            
            guard indexPath.row < leagues.count else {
                return cell
            }
            
            let league = leagues[indexPath.row]
            cell.favName.text = league.value(forKey: "leagueName") as? String
            
            if let imgStr = league.value(forKey: "leagueImg") as? String,
               let url = URL(string: imgStr),
               let data = try? Data(contentsOf: url) {
                cell.favImg.image = UIImage(data: data)
            } else {
                cell.favImg.image = UIImage(named: "leaguePlaceHolder")
            }
            


        return cell
    }
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
    
    
    func entityNameForSelectedSegment() -> String {
        switch mySegment.selectedSegmentIndex {
        case 0: return "FootballTable"
        case 1: return "BasketballTable"
        case 2: return "TennisTable"
        case 3: return "CricketTable"
        default: return "FootballTable"
        }
    }

}
