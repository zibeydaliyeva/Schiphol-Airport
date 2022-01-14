//
//  TabBarItem.swift
//  SchipholAiport
//
//  Created by Зибейда Алекперли on 14.11.21.
//

import UIKit

enum TabBarItem: Int, CaseIterable {
    case airports
    case flights
    case settings
    
    var controller: UIViewController {
        switch self {
        case .airports: return AirportsViewController()
        case .flights:  return ReachableAirportsViewController()
        case .settings: return SettingsViewController()
        }
    }
    
    var icon: AssetIdentifier {
        switch self {
        case .airports: return .airports
        case .flights: return .flights
        case .settings: return .settings
        }
    }
    
    var title: String {
        switch self {
        case .airports: return "Airports"
        case .flights: return "Flights"
        case .settings: return "Settings"
        }
    }
    
}



