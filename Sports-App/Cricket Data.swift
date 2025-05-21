//
//  Cricket Data.swift
//  Sports-App
//
//  Created by JETSMobileLabMini11 on 15/05/2025.
//

import Foundation

struct CLeagueResponse: Codable {
    let success: Int
    let result: [CLeague]
}


struct CLeague: Codable {
    let leagueKey: Int
    let leagueName: String
    let leagueYear: String

    enum CodingKeys: String, CodingKey {
        case leagueKey = "league_key"
        case leagueName = "league_name"
        case leagueYear = "league_year"
    }
}

/////////////////////////////////////////////////////////////////////////////////////////////


struct CMatchResponse: Codable {
    let success: Int
    let result: [CMatch]
}

struct CMatch: Codable {
    let eventKey: Int
    let eventDateStart: String
    let eventTime: String
    let eventHomeTeam: String
    let eventAwayTeam: String
    let eventHomeFinalResult: String
    let eventAwayFinalResult: String
    let eventStatus: String
    let eventLive: String
    let eventHomeTeamLogo: String?
    let eventAwayTeamLogo: String?
    
    enum CodingKeys: String, CodingKey {
           case eventKey = "event_key"
           case eventDateStart = "event_date_start"
           case eventTime = "event_time"
           case eventHomeTeam = "event_home_team"
           case eventAwayTeam = "event_away_team"
           case eventHomeFinalResult = "event_home_final_result"
           case eventAwayFinalResult = "event_away_final_result"
           case eventStatus = "event_status"
           case eventLive = "event_live"
           case eventHomeTeamLogo = "event_home_team_logo"
           case eventAwayTeamLogo = "event_away_team_logo"
       }
}

/////////////////////////////////////////////////////////////////////////////////////////////


struct CTeamResponse: Codable {
    let success: Int
    let result: [CTeam]

    enum CodingKeys: String, CodingKey {
        case success
        case result
    }
}

struct CTeam: Codable {
    let teamKey: Int
    let teamName: String
    let teamLogo: String?
    let players: [CPlayer]

    enum CodingKeys: String, CodingKey {
        case teamKey = "team_key"
        case teamName = "team_name"
        case teamLogo = "team_logo"
        case players = "players"
    }
}

/////////////////////////////////////////////////////////////////////////////////////////////

struct CPlayer: Codable {
    let playerKey: Int
    let playerName: String
    let playerImage: String?
    let playerNumber: String
    
    enum CodingKeys: String, CodingKey {
        case playerKey = "player_key"
        case playerName = "player_name"
        case playerImage = "player_image"
        case playerNumber = "player_number"
    }
}
