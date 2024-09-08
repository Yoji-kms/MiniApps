//
//  MiniAppsTableViewCell.swift
//  MiniApps
//
//  Created by Yoji on 08.09.2024.
//

import UIKit

final class MiniAppsTableViewCell: UITableViewCell {
    private lazy var view: UIView = {
        let view = UIView()
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
        self.view = UIView()
    }
    
    func setup(with view: UIView) {
        self.view = view
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
