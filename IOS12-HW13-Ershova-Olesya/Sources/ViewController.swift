//
//  ViewController.swift
//  IOS12-HW13-Ershova-Olesya
//
//  Created by JaloJasela on 29.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI
    
    private var data = [
        SectionData(cells: [
        .switchCell(
            withData: SwitchCellData(
                text: "Авиарежим",
                iconName: "airplane",
                iconBackgroundColor: .orange,
                isOnByDefault: true)),
        .disclosureTextCell(
            withData: DisclosureTextCellData(
                text: "Wi-Fi",
                disclosureText: "Не подключено",
                iconName: "wifi",
                iconBackgroundColor: .link)),
        .disclosureTextCell(
            withData: DisclosureTextCellData(
                text: "Bluetooth",
                disclosureText: "Вкл.",
                iconName: "bold",
                iconBackgroundColor: .link)),
        .defaultCell(
            withData: DefaultCellData(
                text: "Сотовая связь",
                iconName: "antenna.radiowaves.left.and.right",
                iconBackgroundColor: .systemGreen)),
        .defaultCell(
            withData: DefaultCellData(
                text: "Режим модема",
                iconName: "personalhotspot",
                iconBackgroundColor: .systemGreen)),
        .switchCell(
            withData: SwitchCellData(
                text: "VPN",
                iconName: "network.badge.shield.half.filled",
                iconBackgroundColor: .orange,
                isOnByDefault: true)),
    ]),
        SectionData(cells: [
        .defaultCell(
            withData: DefaultCellData(
                text: "Уведомления",
                iconName: "bell.badge.fill",
                iconBackgroundColor: .red)),
        .defaultCell(
            withData: DefaultCellData(
                text: "Звуки, тактильные сигналы",
                iconName: "speaker.wave.3.fill",
                iconBackgroundColor: .systemPink)),
        .defaultCell(
            withData: DefaultCellData(
                text: "Фокусирование",
                iconName: "moon.fill",
                iconBackgroundColor: .systemPurple)),
        .defaultCell(
            withData: DefaultCellData(
                text: "Экранное время",
                iconName: "hourglass",
                iconBackgroundColor: .systemPurple)),
    ]),
        SectionData(cells: [
        .defaultCell(
            withData: DefaultCellData(
                text: "Основные",
                iconName: "gear",
                iconBackgroundColor: .systemGray)),
        .defaultCell(
            withData: DefaultCellData(
                text: "Пункт управления",
                iconName: "switch.2",
                iconBackgroundColor: .systemGray)),
        .defaultCell(
            withData: DefaultCellData(
                text: "Экран и яркость",
                iconName: "sun.max.fill",
                iconBackgroundColor: .systemBlue)),
        .defaultCell(
            withData: DefaultCellData(
                text: "Экран ''Домой'' и билиотека приложений",
                iconName: "square.grid.3x3.bottommiddle.filled",
                iconBackgroundColor: .purple)),
        .defaultCell(
            withData: DefaultCellData(
                text: "Унивесальный доступ",
                iconName: "accessibility",
                iconBackgroundColor: .systemBlue)),
    ])]
    
    private lazy var tableView: UITableView = {
        var table = UITableView(frame: .zero, style: .grouped)
        table.register(DefaultTableViewCell.self, forCellReuseIdentifier: DefaultTableViewCell.identifier)
        table.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        table.register(DisclosureButtonTableViewCell.self, forCellReuseIdentifier: DisclosureButtonTableViewCell.identifier)
        table.allowsSelection = true
        return table
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
      super.viewDidLoad()
        view.backgroundColor = .white
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupHierarchy()
        setupLayout()
    }
   
    // MARK: - Setups
    
    private func setupHierarchy() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
    }

    private func setupLayout() {
        updateLayout(with: view.frame.size)
    }
    
    private func updateLayout(with size: CGSize) {
        self.tableView.frame = view.bounds
    }
}

// MARK: - Extension

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data[section].cells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = data[indexPath.section].cells[indexPath.row]

        switch cellData {
        case .defaultCell(let cellData):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DefaultTableViewCell.identifier, for: indexPath) as? DefaultTableViewCell else {
                return UITableViewCell()
            }

            cell.configure(with: cellData)

            return cell
        case .switchCell(let cellData):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier, for: indexPath) as? SwitchTableViewCell else {
                return UITableViewCell()
            }

            cell.configure(with: cellData)

            return cell
        case .disclosureTextCell(let cellData):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DisclosureButtonTableViewCell.identifier, for: indexPath) as? DisclosureButtonTableViewCell else {
                return UITableViewCell()
            }

            cell.configure(with: cellData)

            return cell
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
