//
//  SettingsViewControllerUITest.swift
//  SchipholAiportUITests
//
//  Created by Зибейда Алекперли on 15.11.21.
//

import XCTest

class SettingsViewControllerUITest: XCTestCase {

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

    func testDidSelectCellAtIndexPath() throws {
        app.tabBars
          .buttons
          .element(boundBy: 2)
          .tap()

        let tableView = app.tables["settingsTable"]
        
        tableView.cells.element(boundBy: 0).tap()
        XCTAssertTrue(tableView.cells.element(boundBy: 0).isSelected)
        
        sleep(2)
        
        tableView.cells.element(boundBy: 1).tap()
        XCTAssertFalse(tableView.cells.element(boundBy: 0).isSelected)
        XCTAssertTrue(tableView.cells.element(boundBy: 1).isSelected)
    }


}
