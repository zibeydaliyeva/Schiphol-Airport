//
//  Flight.swift
//  SchipholAiport
//
//  Created by Зибейда Алекперли on 14.11.21.
//

import Foundation

struct Flight: Decodable {
    let airlineId: String
    let flightNumber: Int
    let departureAirportId: String
    let arrivalAirportId: String
}
