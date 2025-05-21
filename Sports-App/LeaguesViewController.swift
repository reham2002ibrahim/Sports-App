//
//  LeaguesViewController.swift
//  Sports-App
//
//  Created by JETSMobileLabMini11 on 18/05/2025.
//

import UIKit

class LeaguesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var leaguesTable: UITableView!
    
    let nib = UINib(nibName: "LeaguesCellTableViewCell", bundle: nil)
    var leaguesArray:[String] = ["dd","ss","uvigswvigerigh","","ddddddddddddddddddddddddddddddddddddddddddd"]
    
    var sportType : Int?
    var navController = UINavigationController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        leaguesTable.dataSource = self
        leaguesTable.delegate = self
        self.leaguesTable.register(nib, forCellReuseIdentifier: "leaguesCell")
        let url = "https://apiv2.allsportsapi.com/football/"
        let parameters: [String: Any] = [
            "met": "Leagues"
        ]

        NetworkService.fetchData(
            url: url,
            parameters: parameters,
            responseType: FLeagueResponse.self
        ) { result in
            switch result {
            case .success(let response):
                print("Fetched \(response.result.count) leagues")
                for league in response.result {
                    print("League: \(league.leagueName), Country: \(league.countryName ?? "N/A")")
                }
            case .failure(let error):
                print("Failed to fetch leagues: \(error.localizedDescription)")
            }
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaguesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leaguesCell", for: indexPath) as! LeaguesCellTableViewCell
        cell.leagueTitle.text = leaguesArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Matches", bundle: nil)
        let matchesVC = storyboard.instantiateViewController(withIdentifier: "matchesTableViewController") as! MatchesTableViewController
        self.navigationController?.pushViewController(matchesVC, animated: true) 
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
