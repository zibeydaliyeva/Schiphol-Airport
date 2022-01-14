//
//  AirportViewModel.swift
//  SchipholAiport
//
//  Created by Зибейда Алекперли on 14.11.21.
//

import Foundation
import MapKit

struct AirportViewModel {
    let id: String?
    let latitude: Double
    let longitude: Double
    let name: String
    let city: String?
    let countryId: String?
    let closestAirportName: String?
    private let closestAirportDistance: Double?

    var distance: String? {
        return convertDistance()
    }
    
    init(airport: Airport,
         closestAirport: String? = nil,
         closestDistance: Double? = nil) {
        id = airport.id
        latitude = airport.latitude
        longitude = airport.longitude
        name = airport.name
        city = airport.city
        countryId = airport.countryId
        closestAirportName = closestAirport
        closestAirportDistance = closestDistance
    }

    private func convertDistance() -> String? {
        guard closestAirportDistance != nil
        else { return nil }
        
        let distance: Double
        let defaultMeasure = DistanceMeasures.defaultMeasure
        if defaultMeasure == .km {
            distance = closestAirportDistance! / 1000
        } else {
            distance = closestAirportDistance! * 0.000621371
        }
        return String(format: "%.2f %@", distance, defaultMeasure.rawValue)
    }
}

