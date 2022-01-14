//
//  SettingsViewModel.swift
//  SchipholAiport
//
//  Created by Зибейда Алекперли on 14.11.21.
//

import Foundation

final class SettingsViewModel {
    
    private let measures = DistanceMeasures.allCases.map { $0.rawValue }
    
    private var data = [SettingsSection]()
    
    var sectionCount: Int {
        return data.count
    }
    
    func setSettings() {
        let measureSection = SettingsSection(
            title: "Measure",
            value: measures,
            key: AppDefaults.Keys.measure)
        data.append(measureSection)
    }
    
    func getSectionName(at index: Int) -> String? {
        guard sectionCount > index else { return nil }
        let name = data[index].title
        return name
    }
    
    func getRowName(at index: IndexPath) -> String? {
        guard checkIsExistIndex(at: index) else { return nil }
        let setting = data[index.section].value[index.row]
        return setting
    }
    
    func numberOfRowsInSection(at index: Int) -> Int {
        guard sectionCount > index else { return 0 }
        return data[index].value.count
    }
    
    func updateDefaultValue(at index: IndexPath) {
        guard checkIsExistIndex(at: index) else { return }
        let key = data[index.section].key
        let value = data[index.section].value[index.row]
        AppDefaults.setString(value: value, key: key)
    }
    
    func isActive(at index: IndexPath) -> Bool {
        guard checkIsExistIndex(at: index) else { return false }
        let key = data[index.section].key
        let item = data[index.section].value[index.row]
        let defaultsValue = AppDefaults.getString(key: key)
        if item == defaultsValue {
            return true
        }
        return false
    }
    
    private func checkIsExistIndex(at index: IndexPath) -> Bool {
        if sectionCount > index.section,
           data[index.section].value.count > index.row {
            return true
        }
        return false
    }
}
