//
//  Airport.swift
//  SchipholAiport
//
//  Created by Зибейда Алекперли on 14.11.21.
//

import Foundation

struct Airport: Decodable {
    let id: String
    let latitude: Double
    let longitude: Double
    let name: String
    let city: String
    let countryId: String
    var distanceFromAMS: Double?
}
