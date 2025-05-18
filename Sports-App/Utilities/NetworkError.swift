//
//  NetworkError.swift
//  Sports-App
//
//  Created by MAC on 17/05/2025.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    
    var localizedDescription: String {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .noData: return "No data received"
        case .decodingError: return "Failed to decode data"
        }
    }
}
