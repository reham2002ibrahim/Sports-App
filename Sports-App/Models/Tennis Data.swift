//
//  Tennis Data.swift
//  Sports-App
//
//  Created by JETSMobileLabMini11 on 15/05/2025.
//

import Foundation
struct TCountriesResponse: Codable {
    let success: Int
    let result: [TCountry]
}

struct TCountry: Codable {
    let countryKey: Int
    let countryName: String

    enum CodingKeys: String, CodingKey {
        case countryKey = "country_key"
        case countryName = "country_name"
    }
}

/////////////////////////////////////////////////////////////////////////////////////////////

struct TMatchResponse: Codable {
    let success: Int
    let result: [TMatch]
}

struct TMatch: Codable {
    let eventKey: Int
    let eventDate: String
    let eventTime: String
    let eventFirstPlayer: String
    let eventSecondPlayer: String
    let eventFinalResult: String
    let eventStatus: String
    let leagueKey: Int
    let eventFirstPlayerLogo: String?
    let eventSecondPlayerLogo: String?
    enum CodingKeys: String, CodingKey {
            case eventKey = "event_key"
            case eventDate = "event_date"
            case eventTime = "event_time"
            case eventFirstPlayer = "event_first_player"
            case eventSecondPlayer = "event_second_player"
            case eventFinalResult = "event_final_result"
            case eventStatus = "event_status"
            case leagueKey = "league_key"
            case eventFirstPlayerLogo = "event_first_player_logo"
            case eventSecondPlayerLogo = "event_second_player_logo"
        }
}
struct TPlayerResponse: Codable {
    let success: Int
    let result: [TPlayer]
}

struct TPlayer: Codable {
    let playerKey: Int
    let playerName: String
    let playerImage: String?
    
    enum CodingKeys: String, CodingKey {
        case playerKey = "player_key"
        case playerName = "player_name"
        case playerImage = "player_image"
    }
}


////
////  Tennis Data.swift
////  Sports-App
////
////  Created by JETSMobileLabMini11 on 15/05/2025.
////
//
//import Foundation
//struct TCountriesResponse: Codable {
//    let success: Int
//    let result: [TCountry]
//}
//
//struct TCountry: Codable {
//    let countryKey: Int
//    let countryName: String
//
//    enum CodingKeys: String, CodingKey {
//        case countryKey = "country_key"
//        case countryName = "country_name"
//    }
//}
//
///////////////////////////////////////////////////////////////////////////////////////////////
//
//struct TMatchResponse: Codable {
//    let success: Int
//    let result: [TMatch]
//}
//
//struct TMatch: Codable {
//    let eventKey: Int
//    let eventDate: String
//    let eventTime: String
//    let eventFirstPlayer: String
//    let eventSecondPlayer: String
//    let eventFinalResult: String
//    let eventStatus: String
//    let leagueKey: Int
//    let eventFirstPlayerLogo: String?
//    let eventSecondPlayerLogo: String?
//    enum CodingKeys: String, CodingKey {
//            case eventKey = "event_key"
//            case eventDate = "event_date"
//            case eventTime = "event_time"
//            case eventFirstPlayer = "event_first_player"
//            case eventSecondPlayer = "event_second_player"
//            case eventFinalResult = "event_final_result"
//            case eventStatus = "event_status"
//            case leagueKey = "league_key"
//            case eventFirstPlayerLogo = "event_first_player_logo"
//            case eventSecondPlayerLogo = "event_second_player_logo"
//        }
//}
