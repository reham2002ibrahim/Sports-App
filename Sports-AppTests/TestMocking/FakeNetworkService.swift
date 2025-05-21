//
//  FakeNetworkService.swift
//  Sports-App
//
//  Created by MAC on 21/05/2025.
//

import Foundation

class FakeNetworkService {
    var gotError: Bool = false
    var fakeData: Data? = nil
    var fakeError: Error = NSError(domain: "Fake", code: 1, userInfo: nil)

    func fetchData<T: Decodable>(
        url: String,
        parameters: [String: Any]? = nil,
        responseType: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        if gotError {
            completion(.failure(fakeError))
        } else if let data = fakeData {
            let decoded = try? JSONDecoder().decode(T.self, from: data)
            if let decoded = decoded {
                completion(.success(decoded))
            } else {
                completion(.failure(NSError(domain: "Fake", code: 2, userInfo: [NSLocalizedDescriptionKey: "Decoding failed"])))
            }
        } else {
            completion(.failure(NSError(domain: "Fake", code: 3, userInfo: [NSLocalizedDescriptionKey: "No fake data"])))
        }
    }
}
