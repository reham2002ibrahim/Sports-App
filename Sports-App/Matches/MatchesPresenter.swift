//
//  MatchesPresenter.swift
//  Sports-App
//
//  Created by JETSMobileLabMini11 on 21/05/2025.
//

import Foundation
protocol MatchesViewProtocol: AnyObject {
    func displayMatches(_ matches: [Any])
    func displayRecentMatches(_ matches: [Any])
    func displayTeamsOrPlayers(_ data: [Any])
    func showError(_ message: String)
    
}

class MatchesPresenter {
    
    weak var vc : MatchesViewProtocol?
    
    func fetchMatches(url: String, parameters: [String: Any], sportType: MySportType) {
        var updatedParameters = parameters
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            
            let today = Date()
            
        
        switch sportType {
        case .football:
            let threeDaysLater = Calendar.current.date(byAdding: .day, value: 3, to: today)!
            
            let fromDate = formatter.string(from: today)
            let toDate = formatter.string(from: threeDaysLater)
            
            updatedParameters["from"] = fromDate
            updatedParameters["to"] = toDate
            getMatches(responseType: FMatchResponse.self, url: url, parameters: updatedParameters)
        case .basketball:
            let threeDaysLater = Calendar.current.date(byAdding: .day, value: 3, to: today)!
            
            let fromDate = formatter.string(from: today)
            let toDate = formatter.string(from: threeDaysLater)
            
            updatedParameters["from"] = fromDate
            updatedParameters["to"] = toDate
            getMatches(responseType: BFixtureResponse.self, url: url, parameters: updatedParameters)
        case .tennis:
            let oneYearLater = Calendar.current.date(byAdding: .day, value: 3650, to: today)!
            
            let fromDate = formatter.string(from: today)
            let toDate = formatter.string(from: oneYearLater)
            
            updatedParameters["from"] = fromDate
            updatedParameters["to"] = toDate
            getMatches(responseType: TMatchResponse.self, url: url, parameters: updatedParameters)
        case .cricket:
            let oneYearLater = Calendar.current.date(byAdding: .day, value: 3650, to: today)!
            
            let fromDate = formatter.string(from: today)
            let toDate = formatter.string(from: oneYearLater)
            
            updatedParameters["from"] = fromDate
            updatedParameters["to"] = toDate
            getMatches(responseType: CMatchResponse.self, url: url, parameters: updatedParameters)
        }
    }
    
    func fetchRecentMatches(url: String, parameters: [String: Any], sportType: MySportType) {
            var updatedParameters = parameters
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let today = Date()
            
            
            switch sportType {
            case .football:
                let oneWeekAgo = Calendar.current.date(byAdding: .day, value: -7, to: today)!
                updatedParameters["from"] = formatter.string(from: oneWeekAgo)
                updatedParameters["to"] = formatter.string(from: today)
                getMatches(responseType: FMatchResponse.self, url: url, parameters: updatedParameters)
            case .basketball:
                let oneWeekAgo = Calendar.current.date(byAdding: .day, value: -7, to: today)!
                updatedParameters["from"] = formatter.string(from: oneWeekAgo)
                updatedParameters["to"] = formatter.string(from: today)
                getMatches(responseType: BFixtureResponse.self, url: url, parameters: updatedParameters)
            case .tennis:
                let oneWeekAgo = Calendar.current.date(byAdding: .day, value: -3650, to: today)!
                updatedParameters["from"] = formatter.string(from: oneWeekAgo)
                updatedParameters["to"] = formatter.string(from: today)
                getMatches(responseType: TMatchResponse.self, url: url, parameters: updatedParameters)
            case .cricket:
                let oneWeekAgo = Calendar.current.date(byAdding: .day, value: -3650, to: today)!
                updatedParameters["from"] = formatter.string(from: oneWeekAgo)
                updatedParameters["to"] = formatter.string(from: today)
                getMatches(responseType: CMatchResponse.self, url: url, parameters: updatedParameters)
            }
        }
    
    private func getMatches<T: Decodable>(responseType: T.Type, url: String, parameters: [String: Any]) {
        NetworkService.fetchData(
            url: url,
            parameters: parameters,
            responseType: T.self
        ) { [weak self] (result: Result<T, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    let formatter = DateFormatter()
                    formatter.dateFormat = "yyyy-MM-dd"
                    let today = Date()
                    
                    guard let oneWeekAgo = Calendar.current.date(byAdding: .day, value: -7, to: today) else { return }
                    
                    var upcomingMatches: [Any] = []
                    var recentMatches: [Any] = []
                    
                    // Football
                    if let footballResponse = response as? FMatchResponse {
                        for match in footballResponse.result {
                            guard let matchDate = formatter.date(from: match.eventDate) else { continue }
                            
                            if matchDate >= today {
                                upcomingMatches.append(match)
                            } else if matchDate >= oneWeekAgo {
                                recentMatches.append(match)
                            }
                        }
                    }
                    // Basketball
                    else if let basketballResponse = response as? BFixtureResponse {
                        for match in basketballResponse.result {
                            guard let matchDate = formatter.date(from: match.eventDate) else { continue }
                            
                            if matchDate >= today {
                                upcomingMatches.append(match)
                            } else if matchDate >= oneWeekAgo {
                                recentMatches.append(match)
                            }
                        }
                    }
                    // Tennis
                    else if let tennisResponse = response as? TMatchResponse {
                        for match in tennisResponse.result {
                            guard let matchDate = formatter.date(from: match.eventDate) else { continue }
                            
                            if matchDate >= today {
                                upcomingMatches.append(match)
                            } else if matchDate >= oneWeekAgo {
                                recentMatches.append(match)
                            }
                        }
                    }
                    // Cricket
                    else if let cricketResponse = response as? CMatchResponse {
                        for match in cricketResponse.result {
                            guard let matchDate = formatter.date(from: match.eventDateStart) else { continue }
                            
                            if matchDate >= today {
                                upcomingMatches.append(match)
                            } else if matchDate >= oneWeekAgo {
                                recentMatches.append(match)
                            }
                        }
                    }
                    
                    self?.vc?.displayMatches(upcomingMatches)
                    self?.vc?.displayRecentMatches(recentMatches)
                    
                case .failure(let error):
                    self?.vc?.showError(error.localizedDescription)
                }
            }
        }
    }
        
        func fetchTeamsOrPlayers(url: String, parameters: [String: Any], sportType: MySportType) {
            switch sportType {
            case .football:
                getTeams(responseType: FTeamResponse.self, url: url, parameters: parameters)
            case .basketball:
                getTeams(responseType: BTeamResponse.self, url: url, parameters: parameters)
            case .tennis:
                getTeams(responseType: TPlayerResponse.self, url: url, parameters: parameters)
            case .cricket:
                getTeams(responseType: CTeamResponse.self, url: url, parameters: parameters)
            }
        }
        
        private func getTeams<T: Decodable>(responseType: T.Type, url: String, parameters: [String: Any]) {
            NetworkService.fetchData(
                url: url,
                parameters: parameters,
                responseType: T.self
            ) { [weak self] (result: Result<T, Error>) in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let response):
                        var data: [Any] = []
                        if let footballResponse = response as? FTeamResponse {
                            data = footballResponse.result
                            print(data)
                        } else if let basketballResponse = response as? BTeamResponse {
                            data = basketballResponse.result
                        } else if let tennisResponse = response as? TPlayerResponse {
                            data = tennisResponse.result
                        } else if let cricketResponse = response as? CTeamResponse {
                            data = cricketResponse.result
                        }
                        self?.vc?.displayTeamsOrPlayers(data)
                    case .failure(let error):
                        self?.vc?.showError(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    
    
    
    
    
    
    






////
////  MatchesPresenter.swift
////  Sports-App
////
////  Created by JETSMobileLabMini11 on 21/05/2025.
////
//
//import Foundation
//protocol MatchesViewProtocol: AnyObject {
//    func displayMatches(_ matches: [Any])
//    func displayRecentMatches(_ matches: [Any])
//    func showError(_ message: String)
//    
//}
//
//class MatchesPresenter {
//    
//    weak var vc : MatchesViewProtocol?
//    
//    func fetchMatches(url: String, parameters: [String: Any], sportType: MySportType) {
//        var updatedParameters = parameters
//            let formatter = DateFormatter()
//            formatter.dateFormat = "yyyy-MM-dd"
//            
//            let today = Date()
//            
//        
//        switch sportType {
//        case .football:
//            let threeDaysLater = Calendar.current.date(byAdding: .day, value: 3, to: today)!
//            
//            let fromDate = formatter.string(from: today)
//            let toDate = formatter.string(from: threeDaysLater)
//            
//            updatedParameters["from"] = fromDate
//            updatedParameters["to"] = toDate
//            getMatches(responseType: FMatchResponse.self, url: url, parameters: updatedParameters)
//        case .basketball:
//            let threeDaysLater = Calendar.current.date(byAdding: .day, value: 3, to: today)!
//            
//            let fromDate = formatter.string(from: today)
//            let toDate = formatter.string(from: threeDaysLater)
//            
//            updatedParameters["from"] = fromDate
//            updatedParameters["to"] = toDate
//            getMatches(responseType: BFixtureResponse.self, url: url, parameters: updatedParameters)
//        case .tennis:
//            let oneYearLater = Calendar.current.date(byAdding: .day, value: 365, to: today)!
//            
//            let fromDate = formatter.string(from: today)
//            let toDate = formatter.string(from: oneYearLater)
//            
//            updatedParameters["from"] = fromDate
//            updatedParameters["to"] = toDate
//            getMatches(responseType: TMatchResponse.self, url: url, parameters: updatedParameters)
//        case .cricket:
//            let oneYearLater = Calendar.current.date(byAdding: .day, value: 365, to: today)!
//            
//            let fromDate = formatter.string(from: today)
//            let toDate = formatter.string(from: oneYearLater)
//            
//            updatedParameters["from"] = fromDate
//            updatedParameters["to"] = toDate
//            getMatches(responseType: CMatchResponse.self, url: url, parameters: updatedParameters)
//        }
//    }
//    
//    func fetchRecentMatches(url: String, parameters: [String: Any], sportType: MySportType) {
//            var updatedParameters = parameters
//            let formatter = DateFormatter()
//            formatter.dateFormat = "yyyy-MM-dd"
//            let today = Date()
//            let oneWeekAgo = Calendar.current.date(byAdding: .day, value: -7, to: today)!
//            updatedParameters["from"] = formatter.string(from: oneWeekAgo)
//            updatedParameters["to"] = formatter.string(from: today)
//            
//            switch sportType {
//            case .football:
//                getMatches(responseType: FMatchResponse.self, url: url, parameters: updatedParameters)
//            case .basketball:
//                getMatches(responseType: BFixtureResponse.self, url: url, parameters: updatedParameters)
//            case .tennis:
//                getMatches(responseType: TMatchResponse.self, url: url, parameters: updatedParameters)
//            case .cricket:
//                getMatches(responseType: CMatchResponse.self, url: url, parameters: updatedParameters)
//            }
//        }
//    
//    private func getMatches<T: Decodable>(responseType: T.Type, url: String, parameters: [String: Any]) {
//        NetworkService.fetchData(
//            url: url,
//            parameters: parameters,
//            responseType: T.self
//        ) { [weak self] (result: Result<T, Error>) in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let response):
//                    let formatter = DateFormatter()
//                    formatter.dateFormat = "yyyy-MM-dd"
//                    let today = Date()
//                    
//                    guard let oneWeekAgo = Calendar.current.date(byAdding: .day, value: -7, to: today) else { return }
//                    
//                    var upcomingMatches: [Any] = []
//                    var recentMatches: [Any] = []
//                    
//                    // Football
//                    if let footballResponse = response as? FMatchResponse {
//                        for match in footballResponse.result {
//                            guard let matchDate = formatter.date(from: match.eventDate) else { continue }
//                            
//                            if matchDate >= today {
//                                upcomingMatches.append(match)
//                            } else if matchDate >= oneWeekAgo {
//                                recentMatches.append(match)
//                            }
//                        }
//                    }
//                    // Basketball
//                    else if let basketballResponse = response as? BFixtureResponse {
//                        for match in basketballResponse.result {
//                            guard let matchDate = formatter.date(from: match.eventDate) else { continue }
//                            
//                            if matchDate >= today {
//                                upcomingMatches.append(match)
//                            } else if matchDate >= oneWeekAgo {
//                                recentMatches.append(match)
//                            }
//                        }
//                    }
//                    // Tennis
//                    else if let tennisResponse = response as? TMatchResponse {
//                        for match in tennisResponse.result {
//                            guard let matchDate = formatter.date(from: match.eventDate) else { continue }
//                            
//                            if matchDate >= today {
//                                upcomingMatches.append(match)
//                            } else if matchDate >= oneWeekAgo {
//                                recentMatches.append(match)
//                            }
//                        }
//                    }
//                    // Cricket
//                    else if let cricketResponse = response as? CMatchResponse {
//                        for match in cricketResponse.result {
//                            guard let matchDate = formatter.date(from: match.eventDateStart) else { continue }
//                            
//                            if matchDate >= today {
//                                upcomingMatches.append(match)
//                            } else if matchDate >= oneWeekAgo {
//                                recentMatches.append(match)
//                            }
//                        }
//                    }
//                    
//                    self?.vc?.displayMatches(upcomingMatches)
//                    self?.vc?.displayRecentMatches(recentMatches)
//                    
//                case .failure(let error):
//                    self?.vc?.showError(error.localizedDescription)
//                }
//            }
//        }
//    }
//    
//    
//    
//    
//    
//    
//    
//    
//}
//
//
