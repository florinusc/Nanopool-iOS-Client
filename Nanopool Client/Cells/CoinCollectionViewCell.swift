//
//  CoinCollectionViewCell.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 12/09/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

class CoinCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - Setup
    func setup(with viewModel: CoinCellViewModel) {
        imageView.image = UIImage(named: viewModel.imagePath)
        self.borderWidth = 1.0
        self.borderColor = .black
        self.cornerRadius = self.height / 2
    }
}
