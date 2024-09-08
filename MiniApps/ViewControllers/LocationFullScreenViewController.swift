//
//  LocationFullScreenViewController.swift
//  MiniApps
//
//  Created by Yoji on 08.09.2024.
//

import UIKit
import LocationPackage

final class LocationFullScreenViewController: UIViewController {
    private lazy var locationView: LocationView = {
        let view = LocationView(frame: self.view.frame)
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
        self.locationView.backgroundColor = backgroundColor
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: Setups
    private func setupViews() {
        self.view.addSubview(self.locationView)
        
        NSLayoutConstraint.activate([
            self.locationView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.locationView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.locationView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.locationView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
