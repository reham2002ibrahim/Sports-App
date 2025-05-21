//
//  FavoriteViewController.swift
//  Sports-App
//
//  Created by MAC on 19/05/2025.
//

import UIKit
import Reachability

private let reuseIdentifier = "cell"

class FavoriteViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var mySegment: UISegmentedControl!

    @IBOutlet weak var favoriteTable: UITableView!
    var reachability: Reachability?
    
    override func viewWillAppear(_ animated: Bool) {
        mySegment.selectedSegmentIndex = 0
        favoriteTable.reloadData()


    }
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteTable.delegate = self
        favoriteTable.dataSource = self
        favoriteTableStyle()
        do {
            reachability = try Reachability()
            try reachability?.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
        mySegment.selectedSegmentIndex = 0

        let nib = UINib(nibName: "CustomFavTableViewCell", bundle: nil)
        self.favoriteTable!
            .register(nib, forCellReuseIdentifier: reuseIdentifier)
        favoriteTable.reloadData()

    }
    
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
        return tableView.frame.height / 4 - 2
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
           let url = URL(string: imgStr) {
            cell.favImg.image = UIImage(named: "leaguePlaceHolder")
            URLSession.shared.dataTask(with: url) { data, _, _ in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        cell.favImg.image = image
                    }
                }
            }.resume()
        } else {
            cell.favImg.image = UIImage(named: "leaguePlaceHolder")
        }
            


        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let currentTableName = entityNameForSelectedSegment()
            let league = CoreDataService.shared.getAllLeagues(from: currentTableName)[indexPath.row]
            
            let alert = UIAlertController(
                title: "Delete League",
                message: "Are you sure you want to delete this league?",
                preferredStyle: .alert
            )
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in
                tableView.setEditing(false, animated: true)
            })
            
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive) { [weak self] _ in
                guard self != nil else { return }
                
                if let leagueId = league.value(forKey: "leagueId") as? Int {
                    CoreDataService.shared.deleteLeague(from: currentTableName, id: leagueId)
                    
                    tableView.deleteRows(at: [indexPath], with: .automatic)
                    
                     tableView.reloadData()
                }
            })
            
            present(alert, animated: true)
        }
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let reachability = reachability, reachability.connection != .unavailable {
            let storyboard = UIStoryboard(name: "Matches", bundle: nil)
            if let matchVC = storyboard.instantiateViewController(withIdentifier: "matchesTableViewController") as? MatchesTableViewController {
                let tableName = entityNameForSelectedSegment()
                   let leagues = CoreDataService.shared.getAllLeagues(from: tableName)
                   guard indexPath.row < leagues.count else { return }
                   let league = leagues[indexPath.row]
           
                   guard let leagueId = league.value(forKey: "leagueId") as? Int else { return }
           
           //     matchVC.leagueId = leagueId
              //  matchVC.sportType = tableName
                
                navigationController?.pushViewController(matchVC, animated: true)
            }
        } else {
            let alert = UIAlertController(title: "No Internet", message: "Please check your internet connection.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
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
