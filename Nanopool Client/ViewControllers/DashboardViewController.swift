//
//  ViewController.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 11/07/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, ViewModelBased {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Public variables
    var viewModel: DashboardViewModel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        tableView.tableFooterView = UIView()
    }
}

extension DashboardViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension DashboardViewController: Storyboarded {
    static var storyboardName: Storyboards { return .main }
}

