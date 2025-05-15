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
    let eventHomeTeamLogo: String
    let eventAwayTeamLogo: String
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
    let playerImage: String
    let playerNumber: String
    
    enum CodingKeys: String, CodingKey {
        case playerKey = "player_key"
        case playerName = "player_name"
        case playerImage = "player_image"
        case playerNumber = "player_number"
    }
}
