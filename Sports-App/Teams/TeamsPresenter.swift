//
//  TeamsPresenter.swift
//  Sports-App
//
//  Created by MAC on 18/05/2025.
//

import Foundation

class PlayersPresenter {
    weak var view: PlayersViewProtocol?
    
    func attachView(_ view: PlayersViewProtocol) {
        self.view = view
    }
        
    func fetchPlayers(for teamId: Int) {
        let apiKey = "8526db2c8daaf7d2d61118d6f06f42aacb0ca62930f94b6c94bf9d5692fbd2cf"
        let url = "https://apiv2.allsportsapi.com/football/?met=Teams&APIkey=\(apiKey)&teamId=\(teamId)"
        
        xNetworkService.fetchData(urlString: url, responseType: FTeamResponse.self) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let teamResponse):
                    guard let team = teamResponse.result.first else {
                        self?.view?.showError("No team found with this ID")
                        return
                    }
                    
                    guard let players = team.players, !players.isEmpty else {
                        self?.view?.showError("No players data available")
                        return
                    }
                    
                    let validPlayers = players.compactMap { player -> FPlayer? in
                        guard let _ = player.playerName else { return nil }
                        return player
                    }
                    
                    self?.view?.displayPlayers(validPlayers)
                    
                case .failure(let error):
                    self?.view?.showError("Failed to load players: \(error.localizedDescription)")
                }
            }
        }
    }

    }
