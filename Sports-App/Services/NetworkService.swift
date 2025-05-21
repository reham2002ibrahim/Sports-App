////
////  SportsAPIService.swift
////  Sports-App
////
////  Created by MAC on 17/05/2025.
//
//
//  Created by MAC on 17/05/2025.


//import Foundation
//import Alamofire
//
class xNetworkService {
    
    private static let apiKey = "8526db2c8daaf7d2d61118d6f06f42aacb0ca62930f94b6c94bf9d5692fbd2cf"
    
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


//import Foundation
//import Alamofire
//
//class NetworkService {
//    
//    private static let apiKey = "8526db2c8daaf7d2d61118d6f06f42aacb0ca62930f94b6c94bf9d5692fbd2cf"
//    
//    static func fetchData<T: Decodable>(
//        urlString: String,
//        responseType: T.Type,
//        completion: @escaping (Result<T, Error>) -> Void
//    ) {
//        AF.request(urlString)
//            .validate()
//            .responseDecodable(of: T.self) { response in
//                switch response.result {
//                case .success(let decodedResponse):
//                    completion(.success(decodedResponse))
//                case .failure(let error):
//                    completion(.failure(error))
//                }
//            }
//    }
//}
import Foundation
import Alamofire

class NetworkService {
    
    private static let apiKey =
    "48ce930fc50312caeb8b857e26dbd344778fa9cf65b1562c4284b9f3f6f4e1e5"
   // "8526db2c8daaf7d2d61118d6f06f42aacb0ca62930f94b6c94bf9d5692fbd2cf"
    
    
    static func fetchData<T: Decodable>(
        url: String,
        parameters: [String: Any]? = nil,
        responseType: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        var allParams = parameters ?? [:]
        allParams["APIkey"] = apiKey
        allParams["apikey"] = apiKey

        AF.request(url, parameters: allParams)
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


