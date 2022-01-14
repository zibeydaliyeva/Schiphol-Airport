//
//  ReachableAirportCellViewModel.swift
//  SchipholAiport
//
//  Created by Зибейда Алекперли on 14.11.21.
//

import Foundation

struct ReachableAirportCellViewModel {
    
    let name: String
    
    private let distanceFromAMS: Double?

    var distance: String? {
        return convertDistance()
    }
    
    init(name: String, distanceFromAMS: Double?) {
        self.name = name
        self.distanceFromAMS = distanceFromAMS
    }
    
    private func convertDistance() -> String? {
        guard distanceFromAMS != nil
        else { return nil }
        
        let distance: Double
        let defaultMeasure = DistanceMeasures.defaultMeasure
        if defaultMeasure == .km {
            distance = distanceFromAMS! / 1000
        } else {
            distance = distanceFromAMS! * 0.000621371
        }
        return String(format: "%.2f %@", distance, defaultMeasure.rawValue)
    }
    
}

