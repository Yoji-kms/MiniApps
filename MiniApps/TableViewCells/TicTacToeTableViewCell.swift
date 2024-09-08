//
//  TicTacToeTableViewCell.swift
//  MiniApps
//
//  Created by Yoji on 08.09.2024.
//

import UIKit
import TicTacToe

final class TicTacToeTableViewCell: UITableViewCell, TableViewCellWithSetup {
    // MARK: Lifecycle
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func prepareForReuse() {
    }
    
    func setup(with frame: CGRect, large: Bool, backgroundColor: UIColor) {
        let width = frame.width
        let height = frame.height
        let less = width > height ? height : width
        let newFrame = CGRect(x: 0, y: 0, width: less, height: less)
        
        let view = TicTacToeView(frame: newFrame)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = large
        view.backgroundColor = backgroundColor
        
        self.contentView.backgroundColor = backgroundColor
        self.contentView.addSubview(view)
        
        let heightAnchor = self.contentView.heightAnchor
        let widthAnchor = self.contentView.widthAnchor
        
        let lessAnchor = width > height ? heightAnchor : widthAnchor
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            view.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            view.heightAnchor.constraint(equalTo: lessAnchor),
            view.widthAnchor.constraint(equalTo: lessAnchor)
        ])
    }
}
