//
//  MatchesTableViewController.swift
//  Sports-App
//
//  Created by JETSMobileLabMini11 on 20/05/2025.
//

import UIKit

class MatchesTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "UpComingTableViewCell", bundle: nil), forCellReuseIdentifier: "upcomingMatchesTableCell")
        tableView.register(UINib(nibName: "RecentTableViewCell", bundle: nil), forCellReuseIdentifier: "recentMatchesTableCell")
        tableView.register(UINib(nibName: "MatchesTeamsTableViewCell", bundle: nil), forCellReuseIdentifier: "matchesTableViewCell")
        let backgroundImage = UIImageView(frame: tableView.bounds)
        backgroundImage.image = UIImage(named: "wbackground")
        backgroundImage.contentMode = .scaleAspectFill
        tableView.backgroundView = backgroundImage

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return section == 1 ? 10 : 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "upcomingMatchesTableCell", for: indexPath) as! UpComingTableViewCell
            return cell
        case 1 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "recentMatchesTableCell", for: indexPath) as! RecentTableViewCell
            cell.awayTeamLogo.image = UIImage(named: "footballonbording")
            cell.homeTeamLogo.image = UIImage(named: "footballonbording")
            cell.score.text = "1-1"
            cell.dateLabel.text = "12/12/2020"
            cell.timeLabel.text = "12:00"
            cell.homeTeamName.text = "Team A"
            cell.awayTeamName.text = "Team B"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "matchesTableViewCell", for: indexPath) as! MatchesTeamsTableViewCell
            return cell
            
        default: return UITableViewCell()
            
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section
        {
        case 0:
            return 220
        case 1:
            return 130
        case 2:
            return 150
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .systemGroupedBackground

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .label
        switch section {
        case 0:
            label.text = "Upcoming Matches"
        case 1:
            label.text = "Recent Matches"
        case 2:
            label.text = "Teams"
        default:
            label.text = ""
        }

        headerView.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }


    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
