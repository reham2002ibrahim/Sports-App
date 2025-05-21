//
//  NetworkServiceTests.swift
//  Sports-App
//
//  Created by MAC on 21/05/2025.
//

import XCTest
import Sports_App

final class NetworkServiceTests: XCTestCase {
    func testFakeNetworkServiceSuccess() {
        let fakeNetwork = FakeNetworkService()
        let expected = DummyModel(id: 1, name: "Test")
        fakeNetwork.gotError = false
        fakeNetwork.fakeData = try? JSONEncoder().encode(expected)

        let expectation = self.expectation(description: "Completion")

        fakeNetwork.fetchData(url: "test", responseType: DummyModel.self) { result in
            switch result {
            case .success(let model):
                XCTAssertEqual(model, expected)
            case .failure:
                XCTFail("will succeed")
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1)
    }

    func testFakeNetworkServiceFailure() {
        let fakeService = FakeNetworkService()
        fakeService.gotError = true

        let expectation = self.expectation(description: "Completion")

        fakeService.fetchData(url: "test", responseType: DummyModel.self) { result in
            switch result {
            case .success:
                XCTFail("will fail")
            case .failure(let error):
                XCTAssertNotNil(error)
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1)
    }
}
