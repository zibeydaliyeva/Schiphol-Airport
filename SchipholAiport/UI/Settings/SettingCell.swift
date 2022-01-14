//
//  SettingCell.swift
//  SchipholAiport
//
//  Created by Зибейда Алекперли on 14.11.21.
//

import UIKit

final class SettingCell: UITableViewCell {
    
    static let ID = "SettingCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel(
            fontSize: 14,
            color: .mainTextColor)
        return label
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        setupUI()
    }
    
    // MARK: - Private
    
    private func setupUI() {
        self.preservesSuperviewLayoutMargins = false
        self.layoutMargins = .zero
        self.separatorInset = .zero
        self.selectionStyle = .none
        self.backgroundColor = .white
    }
    
    private func addSubviews() {
        contentView.addSubview(titleLabel)
    }
    
    private func setConstraints() {
        titleLabel.anchor(
            .top(10),
            .bottom(-10),
            .leading(20),
            .trailing(-20))
    }
    
    
    // MARK: - Set data
    
    func configure(_ title: String?) {
        titleLabel.text = title
    }
    
}
