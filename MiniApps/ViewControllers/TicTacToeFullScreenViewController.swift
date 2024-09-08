//
//  TicTacToeFullScreenViewController.swift
//  MiniApps
//
//  Created by Yoji on 08.09.2024.
//

import UIKit
import TicTacToe

final class TicTacToeFullScreenViewController: UIViewController {
    private lazy var ticTacToeView: TicTacToeView = {
        let view = TicTacToeView(frame: self.view.frame)
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
        self.ticTacToeView.backgroundColor = backgroundColor
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: Setups
    private func setupViews() {
        self.view.addSubview(self.ticTacToeView)
        
        NSLayoutConstraint.activate([
            self.ticTacToeView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.ticTacToeView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.ticTacToeView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.ticTacToeView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

