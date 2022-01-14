//
//  DistanceMeasures.swift
//  SchipholAiport
//
//  Created by Зибейда Алекперли on 14.11.21.
//

import Foundation

enum DistanceMeasures: String, CaseIterable {
    case km
    case mi
    
    static var defaultMeasure: DistanceMeasures {
        if let measure = AppDefaults.getString(key: .measure),
           let value = DistanceMeasures(rawValue: measure){
            return value
        }
        else {
            let km = DistanceMeasures.km
            AppDefaults.setString(value: km.rawValue, key: .measure)
            return km
        }
        
    }
}
