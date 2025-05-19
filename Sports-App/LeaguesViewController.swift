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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        leaguesTable.dataSource = self
        leaguesTable.delegate = self
        self.leaguesTable.register(nib, forCellReuseIdentifier: "leaguesCell")

        // Do any additional setup after loading the view.
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
