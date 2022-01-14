//
//  SettingsViewController.swift
//  SchipholAiport
//
//  Created by Зибейда Алекперли on 14.11.21.
//

import UIKit

final class SettingsViewController: BaseViewController {
    
    private lazy var viewModel = SettingsViewModel()
    
    private let tableView: UITableView = {
        let tableView = UITableView(
            backgroundColor: .lightGrayColor,
            seperatorStyle: .singleLine)
        tableView.accessibilityIdentifier = "settingsTable"
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func setupUI() {
        navigationItem.title = "Settings"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(
            SettingCell.self,
            forCellReuseIdentifier: SettingCell.ID)
        
        setSettings()
    }
    
    override func addSubviews() {
        super.addSubviews()
        view.addSubview(tableView)
    }
    
    override func setConstraints() {
        super.setConstraints()
        tableView.anchor(.fillSuperview(isSafeArea:true))
    }
  
    
    // MARK: - Private

    private func setSettings() {
        viewModel.setSettings()
        tableView.reloadData()
    }
    
}

// MARK: - Table view data source

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sectionCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(at: section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = SettingsHeaderView()
        let sectionName = viewModel.getSectionName(at: section)
        headerView.configure(sectionName)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:
            SettingCell.ID, for: indexPath) as? SettingCell
        else { return UITableViewCell() }
        
        let title = viewModel.getRowName(at: indexPath)
        let isActive = viewModel.isActive(at: indexPath)
        cell.accessoryType = isActive ? .checkmark : .none
        cell.configure(title)
        return cell
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.updateDefaultValue(at: indexPath)
        tableView.reloadData()
    }
    
}

