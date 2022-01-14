//
//  AirportsViewControllerUITest.swift
//  SchipholAiportUITests
//
//  Created by Зибейда Алекперли on 15.11.21.
//

import XCTest

class AirportsViewControllerUITest: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
        try super.tearDownWithError()
    }

    func testDidSelectAirport() {
        let amsterdamSchipholAirportElement = app.otherElements["Amsterdam-Schiphol Airport"]
        amsterdamSchipholAirportElement.tap()
        sleep(2)
        amsterdamSchipholAirportElement.tap()
    }

}
