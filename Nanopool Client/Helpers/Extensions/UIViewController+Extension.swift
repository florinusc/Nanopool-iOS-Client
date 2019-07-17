//
//  UIViewController+Extension.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 17/07/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentAlert(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        okAction.setValue(UIColor.black, forKey: "titleTextColor")
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func presentAlert(for error: Error?) {
        guard let error = error else { return }
        presentAlert(with: "Error", message: error.localizedDescription)
    }
    
    func presentAlert(for errors: [Error]) {
        let errorMessages = errors.map { $0.localizedDescription }
        let message = errorMessages.joined(separator: "\n")
        presentAlert(with: "Error", message: message)
    }
}
