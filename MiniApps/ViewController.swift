//
//  ViewController.swift
//  MiniApps
//
//  Created by Yoji on 04.09.2024.
//

import UIKit
import TicTacToe
import WeatherPackage
import LocationPackage

class ViewController: UIViewController {
    private let viewModel = MiniAppsViewModel()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MiniAppsTableViewCell.self, forCellReuseIdentifier: "MiniAppsTableViewCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "default")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemRed
        self.setupViews()
        
    }
    
    private func setupViews() {
        self.view.addSubview(self.tableView)
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        self.view.frame.height / 8
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let height = tableView.rowHeight
        let width = tableView.frame.width
        let frame = CGRect(x: 0, y: 0, width: width, height: height)
        let view = switch self.viewModel.data[indexPath.row] {
        case .ticTacToe:
            TicTacToeView(frame: frame)
        case .weather:
            WeatherView(frame: frame)
        case .location:
            LocationView(frame: frame)
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MiniAppsTableViewCell", for: indexPath) as? MiniAppsTableViewCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        
        cell.clipsToBounds = true
        cell.setup(with: view)
        
        return cell
    }
}

