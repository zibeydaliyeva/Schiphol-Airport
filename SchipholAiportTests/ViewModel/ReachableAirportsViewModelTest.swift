//
//  ReachableAirportsViewModelTest.swift
//  SchipholAiportTests
//
//  Created by Зибейда Алекперли on 15.11.21.
//

import XCTest
@testable import SchipholAiport

class ReachableAirportsViewModelTest: XCTestCase {

    private var sut: ReachableAirportsViewModel!
    private var apiService: APIServiceProtocol!
    
    override func setUpWithError() throws {
        apiService = TestConstants.testWithMock ? MockAPIService() : APIService()
        sut = ReachableAirportsViewModel(apiService)
    }

    override func tearDownWithError() throws {
        sut = nil
        apiService = nil
        try super.tearDownWithError()
    }

    func testGetReachableAirports() {
        let expectation = self.expectation(description: "Get reachable airports")
        getReachableAirportsTest(expectation)
        XCTAssertEqual(sut.airportsCount > 0, true)
        
        let airportFirstDistance = sut.getReachableAirport(at: 0)?.distance
        let airportSecondDistance = sut.getReachableAirport(at: 1)?.distance
        XCTAssertLessThan(atof(airportFirstDistance), atof(airportSecondDistance))
    }
    
    func testGetReachableAirport() {
        let expectation = self.expectation(description: "Get reachable airport cell view model")
        getReachableAirportsTest(expectation)
        let cellViewModel = sut.getReachableAirport(at: 0)
        XCTAssertNotNil(cellViewModel)
    }
    
    func testGetAirportWithNulData() {
        let cellViewModel = sut.getReachableAirport(at: 0)
        XCTAssertNil(cellViewModel)
    }
    
    private func getReachableAirportsTest(_ expectation: XCTestExpectation) {
        sut.getReachableAirports { error in
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: TestConstants.timeIntervale) { error in
            if let error = error {
                XCTFail(error.localizedDescription)
            }
        }
    }
    
}
