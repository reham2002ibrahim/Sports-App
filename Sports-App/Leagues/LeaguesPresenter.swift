//
//  LeaguesPresenter.swift
//  Sports-App
//
//  Created by MAC on 17/05/2025.
//
import Foundation
import UIView_Shimmer

protocol LeaguesViewProtocol: AnyObject {
    func displayLeagues(_ leagues: [Any])
    func showError(_ message: String)
}

class LeaguesPresenter {
    weak var vc: LeaguesViewProtocol!
    
    func attachView(_ viewController: LeaguesViewProtocol) {
        self.vc = viewController
    }

    func fetchLeagues(url: String, parameters: [String: Any], sportType: MySportType) {
        switch sportType {
        case .football:
            getLeagues(responseType: FLeagueResponse.self, url: url, parameters: parameters)
        case .basketball:
            getLeagues(responseType: BLeagueResponse.self, url: url, parameters: parameters)
        case .tennis:
            getLeagues(responseType: TCountriesResponse.self, url: url, parameters: parameters)
        case .cricket:
            getLeagues(responseType: CLeagueResponse.self, url: url, parameters: parameters)
        }
    }
    
    private func getLeagues<T: Decodable>(responseType: T.Type, url: String, parameters: [String: Any]) {
        NetworkService.fetchData(
            url: url,
            parameters: parameters,
            responseType: T.self
        ) { [weak self] (result: Result<T, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    if let footballResponse = response as? FLeagueResponse {
                        self?.vc.displayLeagues(footballResponse.result)
                    } else if let basketballResponse = response as? BLeagueResponse {
                        self?.vc.displayLeagues(basketballResponse.result)
                    } else if let tennisResponse = response as? TCountriesResponse {
                        self?.vc.displayLeagues(tennisResponse.result)
                    } else if let cricketResponse = response as? CLeagueResponse {
                        self?.vc.displayLeagues(cricketResponse.result)
                    }
                case .failure(let error):
                    self?.vc.showError(error.localizedDescription)
                }
            }
        }
    }
}

enum MySportType {
    case football
    case basketball
    case tennis
    case cricket
}
