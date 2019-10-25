//
//  AddressTableViewCell.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 21/07/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

class AddressTableViewCell: UITableViewCell {
    @IBOutlet private weak var coinImageView: UIImageView!
    @IBOutlet private weak var addressLabel: UILabel!
    
    func configure(with viewModel: AddressCellViewModel) {
        addressLabel.text = viewModel.address
        coinImageView.image = UIImage(named: viewModel.imageName)
    }
}
