//
//  LocationTableViewCell.swift
//  MiniApps
//
//  Created by Yoji on 08.09.2024.
//

import UIKit
import LocationPackage

final class LocationTableViewCell: UITableViewCell, TableViewCellWithSetup {
    private lazy var view: LocationView = {
        let view = LocationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: Lifecycle
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
    }
    
    override func prepareForReuse() {
    }
    
    func setup(with frame: CGRect, large: Bool, backgroundColor: UIColor) {
        self.view.frame = frame
        self.contentView.backgroundColor = backgroundColor
        self.view.backgroundColor = backgroundColor
    }
    
    private func setupViews() {
        self.contentView.addSubview(self.view)
        
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.view.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.view.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
}
