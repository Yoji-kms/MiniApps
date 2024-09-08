//
//  MiniAppsViewModel.swift
//  MiniApps
//
//  Created by Yoji on 08.09.2024.
//

import UIKit
//import TicTacToe
//import WeatherPackage
//import LocationPackage

final class MiniAppsViewModel {
    private(set) var data: [ViewTypes]
    
    enum ViewTypes: CaseIterable {
        case ticTacToe
        case weather
        case location
    }
    
    init() {
        self.data = [
            .ticTacToe,
            .location,
            .weather,
            ViewTypes.allCases.randomElement() ?? .location,
            ViewTypes.allCases.randomElement() ?? .location,
            ViewTypes.allCases.randomElement() ?? .location,
            ViewTypes.allCases.randomElement() ?? .location,
            ViewTypes.allCases.randomElement() ?? .location,
            ViewTypes.allCases.randomElement() ?? .location,
            ViewTypes.allCases.randomElement() ?? .location,
            ViewTypes.allCases.randomElement() ?? .location
        ]
    }
    
}
