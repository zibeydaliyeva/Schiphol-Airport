//
//  ReachableAirportCell.swift
//  SchipholAiport
//
//  Created by Зибейда Алекперли on 14.11.21.
//

import UIKit

final class ReachableAirportCell: UITableViewCell {
    
    static let ID = "ReachableAirportCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel(
            fontSize: 14,
            color: .mainTextColor)
        return label
    }()
    
    private let distanceLabel: UILabel = {
        let label = UILabel(
            fontSize: 12,
            color: .grayColor)
        return label
    }()
    
    private let textStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        addSubviews()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Private
    
    private func setupUI() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    private func addSubviews() {
        contentView.addSubview(textStack)
        textStack.addArrangedSubview(titleLabel)
        textStack.addArrangedSubview(distanceLabel)
    }
    
    private func setConstraints() {
        textStack.anchor(
            .top(5),
            .bottom(-5),
            .leading(10),
            .trailing(-10))
    }
    
    
    // MARK: - Set data
    
    func configure(_ viewModel: ReachableAirportCellViewModel) {
        titleLabel.text = viewModel.name
        distanceLabel.text = viewModel.distance
    }

}

