import UIKit
import UIView_Shimmer

class LeaguesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, LeaguesViewProtocol {

    var isLoading = true
    let shimmerCount = 6

    @IBOutlet weak var leaguesTable: UITableView!
    @IBOutlet weak var leagueLabel: UILabel!

    let nib = UINib(nibName: "LeaguesCellTableViewCell", bundle: nil)

    var sportType: Int?
    var navController = UINavigationController()
    var leagues: [Any] = []
    let presenter = LeaguesPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        leaguesTable.dataSource = self
        leaguesTable.delegate = self
        self.leaguesTable.register(nib, forCellReuseIdentifier: "leaguesCell")
        setupUI()
        isLoading = true
        leaguesTable.reloadData()
        fetchLeagues()
       // leaguesTableStyle()
//        leaguesTable.layer.borderColor = UIColor.lightGray.cgColor
//        leaguesTable.layer.borderWidth = 0.5
//        leaguesTable.layer.cornerRadius = 5
    }

    func setupUI() {
        switch sportType {
        case 0:
            leagueLabel.text = "Football Leagues"
        case 1:
            leagueLabel.text = "Basketball Leagues"
        case 2:
            leagueLabel.text = "Tennis Leagues"
        case 3:
            leagueLabel.text = "Cricket Leagues"
        default:
            leagueLabel.text = ""
        }
    }

    func fetchLeagues() {
        presenter.attachView(self)
        guard let sportTypeInt = sportType,
              let mySportType = MySportType(intValue: sportTypeInt) else {
            showError("Invalid sport type")
            return
        }

        let baseURL: String
        switch mySportType {
        case .football: baseURL = "https://apiv2.allsportsapi.com/football"
        case .basketball: baseURL = "https://apiv2.allsportsapi.com/basketball"
        case .tennis: baseURL = "https://apiv2.allsportsapi.com/tennis"
        case .cricket: baseURL = "https://apiv2.allsportsapi.com/cricket"
        }
        let parameters: [String: Any] = ["met": "Leagues"]

        presenter.fetchLeagues(
            url: baseURL,
            parameters: parameters,
            sportType: mySportType
        )
    }

    func displayLeagues(_ leagues: [Any]) {
        self.leagues = leagues
        self.leagues.remove(at: 0)
        self.isLoading = false
        leaguesTable.reloadData()
    }

    func showError(_ message: String) {
        let alert = UIAlertController(
            title: "Error",
            message: "No internet connection to load leagues",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    // MARK: - TableView DataSource & Delegate

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isLoading ? shimmerCount : leagues.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leaguesCell", for: indexPath) as! LeaguesCellTableViewCell

        if isLoading {
            cell.setTemplateWithSubviews(true, viewBackgroundColor: .systemBackground)
            cell.leagueTitle.text = ""
            cell.leagueImage.image = nil
            cell.favBtn.tintColor = .clear
            cell.onFavTapped = nil
            return cell
        } else {
            cell.setTemplateWithSubviews(false)
            let league = leagues[indexPath.row]
            var name: String = ""
            var logo: String? = nil
            var tableName = ""
            var id: Int = 0

            if let footballLeague = league as? FLeague {
                name = footballLeague.leagueName
                logo = footballLeague.leagueLogo
                tableName = "FootballTable"
                id = footballLeague.leagueKey
            } else if let basketballLeague = league as? BLeague {
                name = basketballLeague.leagueName
                logo = "hbhbhbv"
                tableName = "BasketballTable"
                id = basketballLeague.leagueKey
            } else if let tennisLeague = league as? TCountry {
                name = tennisLeague.countryName
                logo = "tennisLeague.leagueLogo"
                tableName = "TennisTable"
                id = tennisLeague.countryKey
            } else if let cricketLeague = league as? CLeague {
                name = cricketLeague.leagueName
                logo = cricketLeague.leagueYear
                tableName = "CricketTable"
                id = cricketLeague.leagueKey
            }

            cell.renderCell(with: name, imageUrl: logo)
            let isFavorite = CoreDataService.shared.isLeagueFavorite(in: tableName, id: id)
            cell.updateFavIcon(isFavorite: isFavorite)
            cell.onFavTapped = {
                if !cell.isFavSelected {
                    CoreDataService.shared.addLeague(to: tableName, id: id, name: name, img: logo ?? "")
                    cell.updateFavIcon(isFavorite: true)
                } else {
                    CoreDataService.shared.deleteLeague(from: tableName, id: id)
                    cell.updateFavIcon(isFavorite: false)
                }
            }
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Matches", bundle: nil)
        let matchesVC = storyboard.instantiateViewController(withIdentifier: "matchesTableViewController") as! MatchesTableViewController
        let league = leagues[indexPath.row]

        if let footballLeague = league as? FLeague {
            matchesVC.leagueID = footballLeague.leagueKey
            matchesVC.sportType = self.sportType ?? 0
            print("Sport Type: \( String(describing: self.sportType)), League ID: \(footballLeague.leagueKey)")
        } else if let basketballLeague = league as? BLeague {
            matchesVC.leagueID = basketballLeague.leagueKey
            matchesVC.sportType = self.sportType ?? 0
        } else if let tennisLeague = league as? TCountry {
            matchesVC.leagueID = tennisLeague.countryKey
            matchesVC.sportType = self.sportType ?? 0
        } else if let cricketLeague = league as? CLeague {
            matchesVC.leagueID = cricketLeague.leagueKey
            matchesVC.sportType = self.sportType ?? 0
        }
        self.navigationController?.pushViewController(matchesVC, animated: true)

    }

    func leaguesTableStyle() {
        leaguesTable.layer.cornerRadius = 25
        leaguesTable.layer.masksToBounds = false
        leaguesTable.layer.shadowColor = UIColor.systemBlue.withAlphaComponent(0.5).cgColor
        leaguesTable.layer.shadowOffset = CGSize(width: 0, height: 0)
        leaguesTable.layer.shadowOpacity = 0.75
        leaguesTable.layer.shadowRadius = 14
        leaguesTable.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        leaguesTable.clipsToBounds = false
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let inset: CGFloat = 16
        let frame = cell.frame
        let newFrame = CGRect(x: frame.origin.x + inset, y: frame.origin.y, width: frame.size.width - 2*inset, height: frame.size.height - 8)
        cell.frame = newFrame
        cell.contentView.frame = newFrame
        cell.contentView.layer.cornerRadius = 20
        cell.contentView.layer.masksToBounds = true
    }
}

extension MySportType {
    init?(intValue: Int) {
        switch intValue {
        case 0: self = .football
        case 1: self = .basketball
        case 2: self = .tennis
        case 3: self = .cricket
        default: return nil
        }
    }
}
