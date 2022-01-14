//
//  AirportsViewModel.swift
//  SchipholAiport
//
//  Created by Зибейда Алекперли on 14.11.21.
//

import Foundation
import CoreLocation

final class AirportsViewModel {
    
    typealias Response = (ErrorService?) -> Void
    
    private var service: APIServiceProtocol
    private var airports: [Airport] = []
    private var airportsMaxDistanced: [Airport] = []
    
    var airportsCount: Int {
        return airports.count
    }
    
    init(_ service: APIServiceProtocol = APIService()) {
        self.service = service
    }

    func getAirports(completion: @escaping Response) {
        service.getAirports { [weak self] result in
            switch result {
            case .success(let airports):
                guard let airports = airports else { return }
                self?.airports = airports
                self?.findMaxDistancedAirport()
                completion(.none)
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    func getAirport(at index: Int) -> AirportViewModel? {
        guard airportsCount > index else { return nil }
        let airport = airports[index]
        return AirportViewModel(airport: airport)
    }
    
    func isFurthestAirport(name: String?) -> Bool {
        guard let name = name else { return false }
        let isFurthest = airportsMaxDistanced.contains(where: { $0.name == name })
        return isFurthest
    }
    
    func getAirportDetail(latitude: Double, longitude: Double ) -> AirportViewModel? {

        let selectedCoordinate = CLLocation(latitude: latitude, longitude: longitude)
        
        var closestAirort: Airport?
        
        var shortestDistance: Double?
        
        var selectedAirport: Airport?
        
        for airport in airports {
            
            //Find selected airport
            if airport.longitude == longitude, airport.latitude == latitude {
                selectedAirport = airport
            }
            
            //Calculate closer airport
            let coordinate = CLLocation(latitude: airport.latitude, longitude: airport.longitude)
            let distance = coordinate.distance(from: selectedCoordinate)

            guard shortestDistance == nil || distance < shortestDistance!,
                  distance != 0
            else { continue }
           
            closestAirort = airport
            shortestDistance = distance
            
        }
        
        guard let airport = selectedAirport, let closest = closestAirort else { return nil }
       
        return AirportViewModel(airport: airport,
                                closestAirport: closest.name,
                                closestDistance: shortestDistance)
    }
    
    private func findMaxDistancedAirport() {
        var maximum: Double = 0
        var airportA: Airport?
        var airportB: Airport?
        
        for i in 0..<airports.count {
            let coordinate = CLLocation(latitude: airports[i].latitude,
                                        longitude: airports[i].longitude)
            
            for j in i+1..<airports.count {
                let coordinateFrom = CLLocation(latitude: airports[j].latitude,
                                                longitude: airports[j].longitude)
                
                let dist = coordinate.distance(from: coordinateFrom)
                if maximum < dist {
                    maximum = dist
                    airportA = airports[i]
                    airportB = airports[j]
                }
            }
        }
        
        guard airportA != nil && airportB != nil else { return }
        
        airportsMaxDistanced = [airportA!, airportB!]
    }
}

