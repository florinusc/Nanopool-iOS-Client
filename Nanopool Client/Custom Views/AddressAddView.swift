//
//  AddressAddView.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 22/07/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

protocol AddressAddViewDelegate: class {
    
}

class AddressAddView: UIView, NibLoadableView {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var addButton: UIButton!
    
    // MARK: - Public variables
    weak var delegate: AddressAddViewDelegate?
    
    // MARK: - Private variables
    private var expanded = false
    private var expandedX: CGFloat {
        return UIScreen.main.bounds.width - 70.0
    }
    
    // MARK: - Private constants
    private let retractedX: CGFloat = 10.0
    private let animationDuration = 0.5
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        self.roundCorners([UIRectCorner.topLeft, UIRectCorner.bottomLeft], radius: self.frame.height / 2)
    }
    
    // MARK: - IBActions
    @IBAction private func onAddTapped(_ sender: UIButton) {
        var newX: CGFloat {
            return expanded ? expandedX : retractedX
        }
        let newFrame = CGRect(x: newX, y: self.frame.origin.y, width: self.frame.width, height: self.frame.height)
        UIView.animate(withDuration: animationDuration) { [weak self] in
            guard let self = self else { return }
            self.frame = newFrame
            self.addButton.rotate(byAngle: self.expanded ? 45.0 : -45.0, ofType: .degrees)
        }
        expanded = !expanded
    }
}
