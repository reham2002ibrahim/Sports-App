//
//  Football Data.swift
//  Sports-App
//
//  Created by JETSMobileLabMini11 on 15/05/2025.
//

import Foundation

struct FLeagueResponse : Codable {
    let success : Int
    let result: [FLeague]
}

struct FLeague: Codable {
    let leagueKey: Int
    let leagueName: String
    let countryKey: Int
    let countryName: String
    let leagueLogo: String
    let countryLogo: String

    enum CodingKeys: String, CodingKey {
        case leagueKey = "league_key"
        case leagueName = "league_name"
        case countryKey = "country_key"
        case countryName = "country_name"
        case leagueLogo = "league_logo"
        case countryLogo = "country_logo"
    }
}

/////////////////////////////////////////////////////////////////////////////////////////////

struct FMatchResponse : Codable {
    let success : Int
    let result: [FMatch]
}

struct FMatch: Codable {
    let eventDate: String
    let eventTime: String
    let eventStatus: String
    let eventHomeTeam: String
    let eventAwayTeam: String
    let homeTeamLogo: String?
    let awayTeamLogo: String?
    let eventFtResult: String?

    enum CodingKeys: String, CodingKey {
        case eventDate = "event_date"
        case eventTime = "event_time"
        case eventStatus = "event_status"
        case eventHomeTeam = "event_home_team"
        case eventAwayTeam = "event_away_team"
        case homeTeamLogo = "home_team_logo"
        case awayTeamLogo = "away_team_logo"
        case eventFtResult = "event_ft_result"
    }
}

/////////////////////////////////////////////////////////////////////////////////////////////

struct FTeamResponse: Codable {
    let success: Int
    let result: [FTeam]
}

struct FTeam: Codable {
    let teamKey: String
    let teamName: String
    let teamLogo: String
    let players: [FPlayer]

    enum CodingKeys: String, CodingKey {
        case teamKey = "team_key"
        case teamName = "team_name"
        case teamLogo = "team_logo"
        case players
    }
}

/////////////////////////////////////////////////////////////////////////////////////////////

struct FPlayerResponse: Codable {
    let success: Int
    let result: [FPlayer]
}

struct FPlayer: Codable {
    let playerKey: Int
    let playerName: String
    let playerNumber: String
    let playerImage: String

    enum CodingKeys: String, CodingKey {
        case playerKey = "player_key"
        case playerName = "player_name"
        case playerNumber = "player_number"
        case playerImage = "player_image"
    }
}
