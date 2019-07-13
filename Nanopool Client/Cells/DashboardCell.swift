//
//  DashboardTableViewCell.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 13/07/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

class DashboardCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var coinNameLabel: UILabel!
    @IBOutlet private weak var hashrateLabel: UILabel!
    @IBOutlet private weak var minerCountLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var logoImageView: UIImageView!
    
    // MARK: - Public variables
    var viewModel: DashboardCellViewModel! {
        didSet { setup(with: viewModel)}
    }
    
    // MARK: - Setup
    private func setup(with viewModel: DashboardCellViewModel) {
        coinNameLabel.text = viewModel.coinName
        hashrateLabel.text = viewModel.hashrateString
        minerCountLabel.text = viewModel.minerCountString
        priceLabel.text = viewModel.priceString
        if let logoImage = UIImage(named: viewModel.coinLogoImageName) {
            logoImageView.image = logoImage
        } else {
            logoImageView.image = nil
        }
    }
    
}
