
import Foundation
import Alamofire

class NetworkService {
    
    private static let apiKey =
    "48ce930fc50312caeb8b857e26dbd344778fa9cf65b1562c4284b9f3f6f4e1e5"
    
    
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
