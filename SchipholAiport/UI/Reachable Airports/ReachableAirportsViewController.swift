//
//  ReachableAirportsViewController.swift
//  SchipholAiport
//
//  Created by Зибейда Алекперли on 14.11.21.
//

import UIKit

final class ReachableAirportsViewController: BaseViewController {
    
    private lazy var viewModel: ReachableAirportsViewModel = {
       return ReachableAirportsViewModel()
    }()
    
    private let tableView: UITableView = {
        let inset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        return UITableView(seperatorStyle: .none, contentInset: inset)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func setupUI() {
        super.setupUI()
        navigationItem.title = "Closest Airports"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(
            ReachableAirportCell.self,
            forCellReuseIdentifier: ReachableAirportCell.ID)
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
    
    private func fetchData() {
        viewModel.getReachableAirports { [weak self] error  in
            if let error = error {
                self?.errorHandler(error)
            } else {
                self?.tableView.reloadData()
            }
        }
    }


}

// MARK: - Table view data source

extension ReachableAirportsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.airportsCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier:
            ReachableAirportCell.ID, for: indexPath) as? ReachableAirportCell
        else { return UITableViewCell() }
        
        if let cellViewModel = viewModel.getReachableAirport(at: indexPath.row) {
            cell.configure(cellViewModel)
        }
        return cell
    }

}
