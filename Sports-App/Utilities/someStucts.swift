//
//  someStucts.swift
//  Sports-App
//
//  Created by MAC on 18/05/2025.
//

struct APIKeys {
    static let main = "8526db2c8daaf7d2d61118d6f06f42aacb0ca62930f94b6c94bf9d5692fbd2cf"
}

enum SportType: String {
    case football
    case basketball
    case tennis
    case cricket

    var url: String {
        return "https://apiv2.allsportsapi.com/\(self.rawValue)/?met=Leagues&APIkey=\(APIKeys.main)"
    }
}
