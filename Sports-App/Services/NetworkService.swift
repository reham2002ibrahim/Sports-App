//
//  SportsAPIService.swift
//  Sports-App
//
//  Created by MAC on 17/05/2025.


import Foundation
import Alamofire

class NetworkService {
    static func fetchData<T: Decodable>(
        urlString: String,
        responseType: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        AF.request(urlString)
            .validate()
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let decodedResponse):
                    completion(.success(decodedResponse))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

