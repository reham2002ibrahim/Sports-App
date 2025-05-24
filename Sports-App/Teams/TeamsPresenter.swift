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
            parameters = [
                "met": "Teams",
                "teamId": teamId,
                "APIkey": apiKey
            ]
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
            url = "https://apiv2.allsportsapi.com/football"
//            parameters = ["met": "Teams", "teamId": teamId]
            parameters = [
                "met": "Teams",
                "teamId": teamId,
                "APIkey": apiKey
            ]
            getPlayers(responseType: FTeamResponse.self, url: url, parameters: parameters)
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


