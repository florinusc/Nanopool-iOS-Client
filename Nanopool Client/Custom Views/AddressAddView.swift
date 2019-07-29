//
//  AddressAddView.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 22/07/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

protocol AddressAddViewDelegate: class {
    func toggle(expanded: Bool)
}

class AddressAddView: UIView, NibLoadableView {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var addButton: UIButton!
    @IBOutlet private weak var addressTextFiled: UITextField!
    @IBOutlet private weak var coinLogoImageView: UIImageView!
    
    // MARK: - Public variables
    weak var delegate: AddressAddViewDelegate?
    
    // MARK: - Private variables
    private var expanded = false
    private lazy var expandedX: CGFloat = {
        return UIScreen.main.bounds.width - 70.0
    }()
    private lazy var initialYPosition: CGFloat = {
        return frame.origin.y
    }()
    
    // MARK: - Private constants
    private let retractedX: CGFloat = 10.0
    private let animationDuration = 0.5
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    deinit {
        removeKeyboardObserver()
    }
    
    // MARK: - Setup
    private func setup() {
        roundCorners([UIRectCorner.topLeft, UIRectCorner.bottomLeft], radius: self.frame.height / 2)
        addKeyboardObserver()
    }
    
    private func addKeyboardObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    private func removeKeyboardObserver() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            let newY = initialYPosition - keyboardHeight + 70.0
            let newFrame = CGRect(x: frame.origin.x, y: newY, width: frame.width, height: frame.height)
            UIView.animate(withDuration: animationDuration) { [weak self] in
                guard let self = self else { return }
                self.frame = newFrame
            }
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        let newY = initialYPosition
        let newFrame = CGRect(x: frame.origin.x, y: newY, width: frame.width, height: frame.height)
        UIView.animate(withDuration: animationDuration) { [weak self] in
            guard let self = self else { return }
            self.frame = newFrame
        }
    }
    
    private func toggle() {
        var newX: CGFloat {
            return expanded ? expandedX : retractedX
        }
        let newFrame = CGRect(x: newX, y: frame.origin.y, width: frame.width, height: frame.height)
        UIView.animate(withDuration: animationDuration) { [weak self] in
            guard let self = self else { return }
            self.frame = newFrame
            self.addButton.rotate(byAngle: self.expanded ? 45.0 : -45.0, ofType: .degrees)
        }
        expanded = !expanded
        if expanded {
            addressTextFiled.becomeFirstResponder()
        } else {
            addressTextFiled.resignFirstResponder()
        }
        delegate?.toggle(expanded: expanded)
    }
    
    // MARK: - IBActions
    @IBAction private func onAddTapped(_ sender: UIButton) {
        toggle()
    }
    
    @IBAction func onTapOnCoinLogo(_ sender: Any) {
        print("tapped on logo")
    }
}
