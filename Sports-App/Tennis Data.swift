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
}
