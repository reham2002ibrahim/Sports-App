//
//  TeamsPresenter.swift
//  Sports-App
//
//  Created by MAC on 18/05/2025.
//


import Foundation

protocol PlayersViewProtocol: AnyObject {
    func displayPlayers(_ players: [Any])
    func showError(_ message: String)
}
class PlayersPresenter {
    weak var vc: PlayersViewProtocol!
    
    func attachView(_ viewController: PlayersViewProtocol) {
        self.vc = viewController
    }
    
    func fetchPlayers(teamId: Int, sportType: Int) {
        let apiKey = "8526db2c8daaf7d2d61118d6f06f42aacb0ca62930f94b6c94bf9d5692fbd2cf"
        let url: String
        let parameters: [String: Any]
        
        switch sportType {
        case 0 :
            url = "https://apiv2.allsportsapi.com/football"
            parameters = ["met": "Teams", "teamId": teamId]
            getPlayers(responseType: FTeamResponse.self, url: url, parameters: parameters)
        case  1 :
            url = "https://apiv2.allsportsapi.com/basketball"
            parameters = ["met": "Teams", "teamId": teamId]
            getPlayers(responseType: BTeamResponse.self, url: url, parameters: parameters)
        case  2 :
            url = "https://apiv2.allsportsapi.com/cricket"
            parameters = ["met": "Teams", "teamId": teamId]
            getPlayers(responseType: CTeamResponse.self, url: url, parameters: parameters)
        case  3 :
            self.vc.showError("Tennis does not have teams or players.")
            return
        default:
            print ("owww")
        }
    }
    
    private func getPlayers<T: Decodable>(responseType: T.Type, url: String, parameters: [String: Any]) {
        NetworkService.fetchData(
            url: url,
            parameters: parameters,
            responseType: T.self
        ) { [weak self] (result: Result<T, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    if let footballResponse = response as? FTeamResponse,
                       let players = footballResponse.result.first?.players {
                        self?.vc.displayPlayers(players)
                    } else if let basketballResponse = response as? BTeamResponse {
                        // Basketball API may not have players, adjust as needed
                        self?.vc.displayPlayers([]) // or basketballResponse.result
                    } else if let cricketResponse = response as? CTeamResponse,
                              let players = cricketResponse.result.first?.players {
                        self?.vc.displayPlayers(players)
                    } else {
                        self?.vc.displayPlayers([])
                    }
                case .failure(let error):
                    self?.vc.showError(error.localizedDescription)
                }
            }
        }
    }
}

//import Foundation
//
//class PlayersPresenter {
//    weak var view: PlayersViewProtocol?
//    
//    func attachView(_ view: PlayersViewProtocol) {
//        self.view = view
//    }
//        
//    func fetchPlayers(for teamId: Int) {
//        let apiKey = "8526db2c8daaf7d2d61118d6f06f42aacb0ca62930f94b6c94bf9d5692fbd2cf"
//        let url = "https://apiv2.allsportsapi.com/football/?met=Teams&APIkey=\(apiKey)&teamId=\(teamId)"
//        
//        xNetworkService.fetchData(urlString: url, responseType: FTeamResponse.self) { [weak self] result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let teamResponse):
//                    guard let team = teamResponse.result.first else {
//                        self?.view?.showError("No team found with this ID")
//                        return
//                    }
//                    
//                    guard let players = team.players, !players.isEmpty else {
//                        self?.view?.showError("No players data available")
//                        return
//                    }
//                    
//                    let validPlayers = players.compactMap { player -> FPlayer? in
//                        guard let _ = player.playerName else { return nil }
//                        return player
//                    }
//                    
//                    self?.view?.displayPlayers(validPlayers)
//                    
//                case .failure(let error):
//                    self?.view?.showError("Failed to load players: \(error.localizedDescription)")
//                }
//            }
//        }
//    }
//
//    }
