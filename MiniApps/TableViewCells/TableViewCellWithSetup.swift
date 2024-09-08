//
//  TableViewCellWithSetup.swift
//  MiniApps
//
//  Created by Yoji on 08.09.2024.
//

import UIKit

protocol TableViewCellWithSetup: UITableViewCell {
    func setup (with frame: CGRect, large: Bool, backgroundColor: UIColor)
}
