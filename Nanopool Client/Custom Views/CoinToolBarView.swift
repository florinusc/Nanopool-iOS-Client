//
//  CoinToolBarView.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 12/09/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

class CoinToolBarView: UIView, NibLoadableView {

    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CoinCollectionViewCell.self)
    }
}

extension CoinToolBarView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CoinCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}

extension CoinToolBarView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height, height: collectionView.frame.height)
    }
}
