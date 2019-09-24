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
    @IBOutlet private weak var shadowBackground: UIView!
    
    // MARK: - Public variables
    override var isSelected: Bool {
        didSet {
            isSelected ? showShadow() : showBorder()
        }
    }
    
    // MARK: - Setup
    func setup(with viewModel: CoinCellViewModel) {
        imageView.image = UIImage(named: viewModel.imagePath)
        borderWidth = 1.0
        borderColor = .black
        cornerRadius = self.height / 2
        shadowBackground.isHidden = true
        clipsToBounds = false
        shadowBackground.clipsToBounds = false
    }
    
    // MARK: - Private helpers
    private func showShadow() {
        shadowBackground.isHidden = false
        borderWidth = 0.0
        borderColor = .clear
    }
    
    private func showBorder() {
        shadowBackground.isHidden = true
        borderWidth = 1.0
        borderColor = .black
    }
}
