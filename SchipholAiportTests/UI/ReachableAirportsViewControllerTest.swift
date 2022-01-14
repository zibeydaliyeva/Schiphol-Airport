//
//  ReachableAirportsViewControllerTest.swift
//  SchipholAiportTests
//
//  Created by Зибейда Алекперли on 15.11.21.
//

import XCTest
@testable import SchipholAiport

class ReachableAirportsViewControllerTest: XCTestCase {

    private var sut: ReachableAirportsViewController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ReachableAirportsViewController()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

}
