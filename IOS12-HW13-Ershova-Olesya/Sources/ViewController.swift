//
//  ViewController.swift
//  IOS12-HW13-Ershova-Olesya
//
//  Created by JaloJasela on 29.02.2024.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Conctants
    
    private func updateLayout(with size: CGSize) {
        self.tableView.frame = view.bounds
    }
    
    
    // MARK: - UI
    
    private var data = [[],[],[]]
    
    private lazy var tableView: UITableView = {
        var table = UITableView(frame: .zero, style: .grouped)
        table.register(DefaultTableViewCell.self, forCellReuseIdentifier: DefaultTableViewCell.identifier)
        table.allowsSelection = true
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setups
    
    private func setupView() {
    }
    
    private func setupHierarchy() {
        self.view.addSubview(tableView)
        tableView.dataSource = self
        tableView.frame = view.bounds
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

// MARK: - Actions

// MARK: - Extension

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DefaultTableViewCell.identifier, for: indexPath) as? DefaultTableViewCell
      
        return cell ?? UITableViewCell()
    }
}

extension ViewController {
    enum Metrics {
        static let backgroundColor: UIColor = .white
        
        static let settingsTitle: String = "Настройки"
        
        static let cellImageCornerRadius = 5
    }
}
