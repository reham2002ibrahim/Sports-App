//
//  BasketBall Data.swift
//  Sports-App
//
//  Created by JETSMobileLabMini11 on 15/05/2025.
//

import Foundation

struct BLeagueResponse : Codable{
    let success : Int
    let result : [BLeague]
}

struct BLeague: Codable {
    let leagueKey: Int
    let leagueName: String
    let countryKey: Int
    let countryName: String

    enum CodingKeys: String, CodingKey {
        case leagueKey = "league_key"
        case leagueName = "league_name"
        case countryKey = "country_key"
        case countryName = "country_name"
    }
}

/////////////////////////////////////////////////////////////////////////////////////////////


struct BFixtureResponse : Codable{
    let success : Int
    let result : [BLeague]
}

struct BFixtureContainer: Codable {
    let eventKey: Int
    let eventDate: String
    let eventTime: String
    let eventHomeTeam: String
    let eventAwayTeam: String
    let eventFinalResult: String
    let eventStatus: String
    let leagueKey: Int
    let eventLive: String
    let eventHomeTeamLogo: String?
    let eventAwayTeamLogo: String?

    enum CodingKeys: String, CodingKey {
        case eventKey = "event_key"
        case eventDate = "event_date"
        case eventTime = "event_time"
        case eventHomeTeam = "event_home_team"
        case eventAwayTeam = "event_away_team"
        case eventFinalResult = "event_final_result"
        case eventStatus = "event_status"
        case leagueKey = "league_key"
        case eventLive = "event_live"
        case eventHomeTeamLogo = "event_home_team_logo"
        case eventAwayTeamLogo = "event_away_team_logo"
    }
}

/////////////////////////////////////////////////////////////////////////////////////////////

struct BTeamResponse: Codable {
    let success: Int
    let result: [BTeam]
}

struct BTeam: Codable {
    let teamKey: Int
    let teamName: String
    let teamLogo: String

    enum CodingKeys: String, CodingKey {
        case teamKey = "team_key"
        case teamName = "team_name"
        case teamLogo = "team_logo"
    }
}
