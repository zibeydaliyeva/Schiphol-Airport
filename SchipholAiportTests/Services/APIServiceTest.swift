//
//  APIServiceTest.swift
//  SchipholAiportTests
//
//  Created by Зибейда Алекперли on 15.11.21.
//

import XCTest
@testable import SchipholAiport

class APIServiceTest: XCTestCase {
    
    private var sut: APIServiceProtocol!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = TestConstants.testWithMock ? MockAPIService() : APIService()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testFetchAirportsFromAPIServer() {
        let expectation = self.expectation(description: "fetch airports from api")
        sut.getAirports { result in
            switch result {
            case .success(let data):
                guard let data = data else { return }
                XCTAssertNotNil(data)
                XCTAssertEqual(data.count > 0, true)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: TestConstants.timeIntervale) { error in
            if let error = error {
                XCTFail(error.localizedDescription)
            }
        }
    }
    
    func testFetchFlightsFromAPIServer() {
        let expectation = self.expectation(description: "fetch flights from api")
        sut.getFlights { result in
            switch result {
            case .success(let data):
                guard let data = data else { return }
                XCTAssertNotNil(data)
                XCTAssertEqual(data.count > 0, true)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: TestConstants.timeIntervale) { error in
            if let error = error {
                XCTFail(error.localizedDescription)
            }
        }
    }
}


class MockAPIService: APIServiceProtocol {
    
    func getAirports(completion: @escaping ResponseResult<[Airport]?>) {
        guard let data = dataFromTestBundleFile(fileName: "Airports", withExtension: "json") else {
            completion(.failure(.parseError))
            return
        }
        do {
            let mockData = try JSONDecoder().decode([Airport].self, from: data)
            completion(.success(mockData))
        } catch {
            completion(.failure(ErrorService.parseError))
        }


    }
    
    func getFlights(completion: @escaping ResponseResult<[Flight]?>) {
        guard let data = dataFromTestBundleFile(fileName: "Flights", withExtension: "json") else {
            completion(.failure(.parseError))
            return
        }
        do {
            let mockData = try JSONDecoder().decode([Flight].self, from: data)
            completion(.success(mockData))
        } catch {
            completion(.failure(ErrorService.parseError))
        }

    }
    
    func dataFromTestBundleFile(fileName: String, withExtension fileExtension: String) -> Data? {

        let testBundle = Bundle(for: APIServiceTest.self)
        let resourceUrl = testBundle.url(forResource: fileName, withExtension: fileExtension)!
        do {
            let data = try Data(contentsOf: resourceUrl)
            return data
        } catch {
            XCTFail("Error reading data from resource file \(fileName).\(fileExtension)")
            return nil
        }
    }
    
}
