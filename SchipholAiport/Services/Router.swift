//
//  Router.swift
//  SchipholAiport
//
//  Created by Зибейда Алекперли on 15.11.21.
//

import Foundation

enum Router {
    private static let baseUrl = "https://flightassets.datasavannah.com/test/"
    
    case getAirports
    case getFlights
    
    private var path: String {
        switch self {
        case .getAirports:
            return "airports.json"
        case .getFlights:
            return "flights.json"
        }
    }
    
    
    private enum HTTPMethod {
        case get
        case post
        case put
        case delete

        var value: String {
            switch self {
            case .get:
                return "GET"
            case .post:
                return "POST"
            case .put:
                return "PUT"
            case .delete:
                return "DELETE"
            }
        }
    }

    private var method: HTTPMethod {
        switch self {
        case .getAirports,
             .getFlights:
            return .get
        }
    }
    
    
    func request() throws -> URLRequest {

        let urlString = Router.baseUrl + path

        guard let url = URL(string: urlString) else { throw ErrorService.incorrectUrl }

        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 5)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = method.value

        return request
    }
}
