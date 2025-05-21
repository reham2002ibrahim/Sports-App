//
//  NetworkServiceCoverageTests.swift
//  Sports-App
//
//  Created by MAC on 21/05/2025.
//

import XCTest
@testable import Sports_App


final class NetworkServiceCoverageTests: XCTestCase {
    func testNetworkServiceFetchData_Coverage() {
        let expectation = self.expectation(description: "Network call")
        
        let url = "https://jsonplaceholder.typicode.com/todos/1"
        
        NetworkService.fetchData(
            url: url,
            responseType: DummyModel.self
        ) { result in
            switch result {
            case .success(let model):
                print("Success: \(model)")
            case .failure(let error):
                print("Error: \(error)")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5)
    }
}
