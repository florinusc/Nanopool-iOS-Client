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
    private var headerFrame: CGRect {
        return CGRect(x: 20.0, y: 0, width: view.frame.width, height: 70.0)
    }
    private let estimatedRowHeight: CGFloat = 200.0
    
    // MARK: - Public variables
    var viewModel: DashboardViewModel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.register(DashboardTableViewCell.self)
        tableView.estimatedRowHeight = estimatedRowHeight
        tableView.rowHeight = UITableView.automaticDimension
        addHeaderToTableView()
    }
    
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
    }
}

extension DashboardViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DashboardTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        return cell
    }
}

extension DashboardViewController: Storyboarded {
    static var storyboardName: Storyboards { return .main }
}

