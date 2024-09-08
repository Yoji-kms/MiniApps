//
//  ViewController.swift
//  MiniApps
//
//  Created by Yoji on 04.09.2024.
//

import UIKit

class ViewController: UIViewController {
//    MARK: Variables
    private let viewModel = MiniAppsViewModel()
    private lazy var tableRowHeight: CGFloat =  {
        switch self.rowHeight {
        case .large:
            self.view.frame.height / 2
        case .small:
            self.view.frame.height / 8
        }
    }()
    private var rowHeight: RowHeight
    
    enum RowHeight {
        case large
        case small
    }
    
//    MARK: Views
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: "WeatherTableViewCell")
        tableView.register(LocationTableViewCell.self, forCellReuseIdentifier: "LocationTableViewCell")
        tableView.register(TicTacToeTableViewCell.self, forCellReuseIdentifier: "TicTacToeTableViewCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "default")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var listBarBtn: UIBarButtonItem = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        button.addTarget(self, action: #selector(listBtnBarAcion), for: .touchUpInside)
        
        let barButton = UIBarButtonItem(customView: button)
        
        return barButton
    }()
    
    private lazy var largerListBarBtn: UIBarButtonItem = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "square.split.1x2.fill"), for: .normal)
        button.addTarget(self, action: #selector(largerListBtnBarAcion), for: .touchUpInside)
        
        let barButton = UIBarButtonItem(customView: button)
        
        return barButton
    }()

//    MARK: Lifecycle
    init(rowHeight: RowHeight) {
        self.rowHeight = rowHeight
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemRed
        self.setupViews()
        self.setupNavigation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }

    
//    MARK: Setups
    private func setupViews() {
        self.view.addSubview(self.tableView)
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    private func setupNavigation() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationItem.style = .navigator
        self.navigationItem.rightBarButtonItems = [
            self.listBarBtn,
            self.largerListBarBtn
        ]
    }
    
//    MARK: Actions
    @objc private func listBtnBarAcion() {
        switch self.rowHeight {
        case .large:
            self.navigationController?.popViewController(animated: true)
        case .small:
            ()
        }
    }
    
    @objc private func largerListBtnBarAcion() {
        switch self.rowHeight {
        case .large:
            ()
        case .small:
            let pushingViewCotroller = ViewController(rowHeight: .large)
            self.navigationController?.pushViewController(pushingViewCotroller, animated: true)
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        self.tableRowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = self.viewModel.data[indexPath.row]
        
        let pushingViewController: UIViewController = switch data.viewType {
        case .ticTacToe:
            TicTacToeFullScreenViewController(backgroundColor: data.backgroundColor)
        case .weather:
            WeatherFullScreenViewController(backgroundColor: data.backgroundColor)
        case .location:
            LocationFullScreenViewController(backgroundColor: data.backgroundColor)
        }
        
        self.navigationController?.pushViewController(pushingViewController, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let height = self.tableRowHeight
        let width = self.tableView.frame.width
        let frame = CGRect(x: 0, y: 0, width: width, height: height)
        let data = self.viewModel.data[indexPath.row]
        let type = data.viewType
        let backgroundColor = data.backgroundColor
        
        guard
            let cell: TableViewCellWithSetup = switch type {
            case .ticTacToe:
                tableView.dequeueReusableCell(withIdentifier: "TicTacToeTableViewCell", for: indexPath) as? TicTacToeTableViewCell
            case .weather:
                tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as? WeatherTableViewCell
            case .location:
                tableView.dequeueReusableCell(withIdentifier: "LocationTableViewCell", for: indexPath) as? LocationTableViewCell
            } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        
        let large = self.rowHeight == .large
        
        cell.setup(with: frame, large: large, backgroundColor: backgroundColor)
        
        return cell
    }
}

