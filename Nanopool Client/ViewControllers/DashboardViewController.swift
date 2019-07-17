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
    
    // MARK: - Private constants
    private let headerHeight: CGFloat = 70.0
    private let estimatedRowHeight: CGFloat = 200.0
    
    // MARK: - Private variables
    private var headerFrame: CGRect {
        return CGRect(x: 20.0, y: 0, width: view.frame.width, height: headerHeight)
    }
    
    // MARK: - Public variables
    var viewModel: DashboardViewModel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        getInformation()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.register(DashboardCell.self)
        tableView.estimatedRowHeight = estimatedRowHeight
        tableView.rowHeight = UITableView.automaticDimension
        addHeaderToTableView()
    }
    
    // MARK: - Private helpers
    private func addHeaderToTableView() {
        let view = UIView(frame: headerFrame)
        let label = UILabel(frame: view.frame)
        view.addSubview(label)
        let todayDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.dashboardHeaderDateFormat
        label.text = dateFormatter.string(from: todayDate)
        label.font = UIFont.dashboardHeaderFont
        label.textColor = .white
        tableView.tableHeaderView = view
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: headerHeight, right: 0)
    }
    
    private func getInformation() {
        viewModel.getPoolInformation { [weak self] (errors) in
            guard let self = self else { return }
            if !errors.isEmpty {
                self.presentAlert(for: errors)
                return
            }
            self.tableView.reloadData()
        }
    }
}

extension DashboardViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCoins
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DashboardCell = tableView.dequeueReusableCell(for: indexPath)
        if let cellViewModel = viewModel.dashboardCellViewModel(at: indexPath) {
            cell.viewModel = cellViewModel
        }
        return cell
    }
}

extension DashboardViewController: Storyboarded {
    static var storyboardName: Storyboards { return .main }
}

