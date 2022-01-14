//
//  SettingsHeaderView.swift
//  SchipholAiport
//
//  Created by Зибейда Алекперли on 15.11.21.
//

import UIKit

final class SettingsHeaderView: UIView {
    
    private var titleLabel: UILabel = {
        let label = UILabel(
            fontSize: 14,
            color: .mainTextColor)
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Private
    
    private func addSubviews() {
        self.addSubview(titleLabel)
    }
    
    private func setConstraints() {
        titleLabel.anchor(
            .top(10),
            .leading(16),
            .trailing(-16),
            .bottom(-10))
    }
    
    
    // MARK: - Set data
    
    func configure(_ title: String?) {
        titleLabel.text = title
    }
}
