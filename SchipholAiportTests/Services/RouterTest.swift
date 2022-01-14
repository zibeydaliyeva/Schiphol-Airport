//
//  RouterTest.swift
//  SchipholAiportTests
//
//  Created by Зибейда Алекперли on 15.11.21.
//

import XCTest
@testable import SchipholAiport

class RouterTest: XCTestCase {

    func testGetAirpotsRequest() {
        let router = Router.getAirports
        do {
            let request = try router.request()
            XCTAssertNotNil(request.allHTTPHeaderFields)
            let value = request.value(forHTTPHeaderField: "Content-Type")
            XCTAssertEqual(value, "application/json")
        } catch {
            XCTFail()
        }
    }

    func testGetFlightsReques() {
        let router = Router.getFlights
        do {
            let request = try router.request()
            XCTAssertNotNil(request.allHTTPHeaderFields)
            let value = request.value(forHTTPHeaderField: "Content-Type")
            XCTAssertEqual(value, "application/json")
        } catch {
            XCTFail()
        }
    }

}
