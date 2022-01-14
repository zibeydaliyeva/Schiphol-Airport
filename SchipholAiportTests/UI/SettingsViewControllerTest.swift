//
//  SettingsViewControllerTest.swift
//  SchipholAiportTests
//
//  Created by Зибейда Алекперли on 15.11.21.
//

import XCTest
@testable import SchipholAiport

class SettingsViewControllerTest: XCTestCase {
    
    private var sut: SettingsViewController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = SettingsViewController()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
}
