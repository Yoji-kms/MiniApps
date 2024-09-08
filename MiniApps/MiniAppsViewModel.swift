//
//  MiniAppsViewModel.swift
//  MiniApps
//
//  Created by Yoji on 08.09.2024.
//

import UIKit

final class MiniAppsViewModel {
    private(set) var data: [Model]
    
    let backgroundColors: [UIColor] = [
        .white,
        .systemMint,
        .systemPink,
        .systemBlue
    ]
    
    struct Model {
        let viewType: ViewTypes
        let backgroundColor: UIColor
    }
    
    enum ViewTypes: CaseIterable {
        case ticTacToe
        case weather
        case location
    }
    
    init() {
        self.data = [
            Model(viewType: .ticTacToe, backgroundColor: .white),
            Model(viewType: .location, backgroundColor: .systemRed),
            Model(viewType: .weather, backgroundColor: .systemCyan),
        ]
        for _ in 1..<10 {
            let model = Model(
                viewType: ViewTypes.allCases.randomElement() ?? .location,
                backgroundColor: backgroundColors.randomElement() ?? .white
            )
            self.data.append(model)
        }
    }
    
}


