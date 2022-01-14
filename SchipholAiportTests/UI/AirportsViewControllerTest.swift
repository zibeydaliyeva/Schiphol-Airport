//
//  AirportsViewControllerTest.swift
//  SchipholAiportTests
//
//  Created by Зибейда Алекперли on 15.11.21.
//

import XCTest
@testable import SchipholAiport

class AirportsViewControllerTest: XCTestCase {

    private var sut: AirportsViewController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = AirportsViewController()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

}
