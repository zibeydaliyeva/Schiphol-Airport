//
//  AirportsViewModelTest.swift
//  SchipholAiportTests
//
//  Created by Зибейда Алекперли on 15.11.21.
//

import XCTest
@testable import SchipholAiport

class AirportsViewModelTest: XCTestCase {

    private var sut: AirportsViewModel!
    private var apiService: APIServiceProtocol!
    
    override func setUpWithError() throws {
        apiService = TestConstants.testWithMock ? MockAPIService() : APIService()
        sut = AirportsViewModel(apiService)
    }

    override func tearDownWithError() throws {
        sut = nil
        apiService = nil
        try super.tearDownWithError()
    }

    func testGetAirports() {
        let expectation = self.expectation(description: "Get airports")
        self.getAirportsTest(expectation)
        XCTAssertEqual(sut.airportsCount > 0, true)
    }
    
    func testGetAirport() {
        let expectation = self.expectation(description: "Get airport cell view model")
        self.getAirportsTest(expectation)
        let cellViewModel = sut.getAirport(at: 0)
        XCTAssertNotNil(cellViewModel)
    }
    
    func testGetAirportWithNulData() {
        let cellViewModel = sut.getAirport(at: 0)
        XCTAssertNil(cellViewModel)
    }
    
    func testIsFurthestAirportFromJsonFile() {
        let expectation = self.expectation(description: "read airports from json file")
        getAirportsTest(expectation)
        
        let firstFurthestAirport = sut.getAirport(at: 0)
        let firstIsFar = sut.isFurthestAirport(name: firstFurthestAirport?.name)
        XCTAssertTrue(firstIsFar)
    
        let secondFurthestAirport = sut.getAirport(at: 2)
        let secondIsFar = sut.isFurthestAirport(name: secondFurthestAirport?.name)
        XCTAssertTrue(secondIsFar)
        
        let otherAirport = sut.getAirport(at: 1)
        let otherAirportIsFar = sut.isFurthestAirport(name: otherAirport?.name)
        XCTAssertFalse(otherAirportIsFar)
    }
    
    func testGetSelectedAirport() {
        let expectation = self.expectation(description: "Get selected airport")
        self.getAirportsTest(expectation)
        
        guard let airport = sut.getAirport(at: 0) else { return }

        let airportViewModel = sut.getAirportDetail(latitude: airport.latitude,
                                                      longitude: airport.longitude)
        
        XCTAssertNotNil(airportViewModel)
    }
    
    func testGetSelectedAirportFromJsonFile() {
        let expectation = self.expectation(description: "Get selected airport from json")
        self.getAirportsTest(expectation)
        
        guard let airport = sut.getAirport(at: 1),
              let closestAirport = sut.getAirport(at:2)
        else { return XCTFail()}

        let airportViewModel = sut.getAirportDetail(latitude: airport.latitude,
                                                    longitude: airport.longitude)
        
        XCTAssertNotNil(airportViewModel)
        XCTAssertEqual(airportViewModel?.closestAirportName, closestAirport.name)
    }
    
    private func getAirportsTest(_ expectation: XCTestExpectation) {
        sut.getAirports { error in
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
