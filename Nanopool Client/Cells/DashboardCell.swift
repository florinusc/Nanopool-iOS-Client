//
//  DashboardTableViewCell.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 13/07/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

class DashboardCell: UITableViewCell {
    
    // MARK: - Public variables
    var viewModel: DashboardCellViewModel! {
        didSet { setup(with: viewModel)}
    }
    
    // MARK: - Setup
    private func setup(with viewModel: DashboardCellViewModel) {}
    
}
