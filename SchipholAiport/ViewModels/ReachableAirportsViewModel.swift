//
//  ReachableAirportsViewModel.swift
//  SchipholAiport
//
//  Created by Зибейда Алекперли on 14.11.21.
//

import Foundation
import CoreLocation

final class ReachableAirportsViewModel {
    
    typealias Response = (ErrorService?) -> Void
    
    private var service: APIServiceProtocol
    private var flights: [Flight] = []
    private var airports: [Airport] = []
    
    var airportsCount: Int {
        return airports.count
    }
    
    init(_ service: APIServiceProtocol = APIService()) {
        self.service = service
    }
    
    func getReachableAirports(completion:  @escaping Response) {
        service.getFlights { [weak self] result in
            switch result {
            case .success(let flights):
                guard let flights = flights else { return }
                self?.flights = flights
                self?.getAirports(completion: completion)
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    private func getAirports(completion:  @escaping Response) {
        service.getAirports { [weak self] result in
            switch result {
            case .success(let airports):
                guard let airports = airports else { return }
                self?.airports = airports
                self?.filterFlights()
                completion(.none)
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    private func filterFlights() {
        
        //Find SCHIPHOL AIRPORT  for getting coordinate
        guard let schipholAirport = airports.first(where: { $0.id == "AMS" })
        else { return }
        
        let schipholLocation = CLLocation(latitude: schipholAirport.latitude,
                                          longitude: schipholAirport.longitude)
        
        //Created unique arrivals ID
        let arrivalIDSet = Set(flights.map { $0.arrivalAirportId })
        
        //The List of airport which has flight from AMS
        airports = airports.filter { arrivalIDSet.contains($0.id) }

        //Sorting aiport by distance
        airports = airports.map({ airport in
            
            let location = CLLocation(latitude: airport.latitude,
                                      longitude: airport.longitude)
            
            let distance = location.distance(from: schipholLocation)
            var airportWithDistance = airport
            airportWithDistance.distanceFromAMS = distance
            return airportWithDistance
        }).sorted {
            return $0.distanceFromAMS! < $1.distanceFromAMS!
        }
    }
    
    func getReachableAirport(at index: Int) -> ReachableAirportCellViewModel? {
        guard airportsCount > index else { return nil }
        let airport = airports[index]
        return ReachableAirportCellViewModel(name: airport.name,
                                             distanceFromAMS: airport.distanceFromAMS)
    }
    
}

