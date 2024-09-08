//
//  WeatherFullScreenViewController.swift
//  MiniApps
//
//  Created by Yoji on 08.09.2024.
//

import UIKit
import WeatherPackage

final class WeatherFullScreenViewController: UIViewController {
    private lazy var weatherView: WeatherView = {
        let view = WeatherView(frame: self.view.frame)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
// MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    init(backgroundColor: UIColor) {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = backgroundColor
        self.weatherView.backgroundColor = backgroundColor
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: Setups
    private func setupViews() {
        self.view.addSubview(self.weatherView)
        
        NSLayoutConstraint.activate([
            self.weatherView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.weatherView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.weatherView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.weatherView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
