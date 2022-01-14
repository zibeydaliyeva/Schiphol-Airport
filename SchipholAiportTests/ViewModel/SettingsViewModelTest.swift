//
//  SettingsViewModelTest.swift
//  SchipholAiportTests
//
//  Created by Зибейда Алекперли on 15.11.21.
//

import XCTest
@testable import SchipholAiport

class SettingsViewModelTest: XCTestCase {

    private var sut: SettingsViewModel!
    
    override func setUpWithError() throws {
        sut = SettingsViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testSetSettings() {
        sut.setSettings()
        XCTAssertEqual(sut.sectionCount > 0, true)
    }
    
    func testGetSectionName() {
        sut.setSettings()
        let section = sut.getSectionName(at: 0)
        XCTAssertNotNil(section)
    }
    
    func testGetSectionNameWithNulData() {
        let section = sut.getSectionName(at: 0)
        XCTAssertNil(section)
    }
    
    func testGetRowName() {
        sut.setSettings()
        let row = sut.getRowName(at: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(row)
    }
    
    func testGetRowNameWithNulData() {
        let row = sut.getRowName(at: IndexPath(row: 0, section: 0))
        XCTAssertNil(row)
    }
    
    func testNumberOfRowsInSection() {
        sut.setSettings()
        let rowCount = sut.numberOfRowsInSection(at: 0)
        XCTAssertEqual(rowCount, 2)
    }
    
    func testUpdateDefaultValue() {
        sut.setSettings()
        let firstIndexPath = IndexPath(row: 0, section: 0)
        let firstRowValue = sut.getRowName(at: firstIndexPath)
        let secondIndexPath = IndexPath(row: 1, section: 0)
        let secondRowValue = sut.getRowName(at: secondIndexPath)
        let thirdIndexPath = IndexPath(row: 2, section: 2)
        let thirdRowValue = sut.getRowName(at: thirdIndexPath)
        
        sut.updateDefaultValue(at: firstIndexPath)
        XCTAssertEqual(DistanceMeasures.defaultMeasure.rawValue, firstRowValue)
        XCTAssertNotEqual(DistanceMeasures.defaultMeasure.rawValue, secondRowValue)
        
        sut.updateDefaultValue(at: secondIndexPath)
        XCTAssertEqual(DistanceMeasures.defaultMeasure.rawValue, secondRowValue)
        XCTAssertNotEqual(DistanceMeasures.defaultMeasure.rawValue, firstRowValue)
        
        sut.updateDefaultValue(at: thirdIndexPath)
        XCTAssertNotEqual(DistanceMeasures.defaultMeasure.rawValue, thirdRowValue)
        XCTAssertEqual(DistanceMeasures.defaultMeasure.rawValue, secondRowValue)
    }
    
    func testIsActive() {
        sut.setSettings()
        let firstIndexPath = IndexPath(row: 0, section: 0)
        let secondIndexPath = IndexPath(row: 1, section: 0)
        let thirdIndexPath = IndexPath(row: 2, section: 2)
        
        sut.updateDefaultValue(at: firstIndexPath)
        
        XCTAssertEqual(sut.isActive(at: firstIndexPath), true)
        XCTAssertEqual(sut.isActive(at: secondIndexPath), false)
        XCTAssertEqual(sut.isActive(at: thirdIndexPath), false)
        
        sut.updateDefaultValue(at: secondIndexPath)
        XCTAssertEqual(sut.isActive(at: firstIndexPath), false)
        XCTAssertEqual(sut.isActive(at: secondIndexPath), true)
        XCTAssertEqual(sut.isActive(at: thirdIndexPath), false)
    }
}
