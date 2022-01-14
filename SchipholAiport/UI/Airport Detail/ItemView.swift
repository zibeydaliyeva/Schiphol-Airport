//
//  ItemView.swift
//  SchipholAiport
//
//  Created by Зибейда Алекперли on 14.11.21.
//

import UIKit

final class ItemView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel(
            fontWeight: .bold,
            fontSize: 12,
            color: .mainTextColor)
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel(
            fontSize: 12,
            color: .mainTextColor,
            numLines: 0)
        return label
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.alignment = .firstBaseline
        return stackView
    }()

    var value: String? {
        get {
            return valueLabel.text
        }
        set {
            valueLabel.text = newValue
        }
    }
    
    init(title: String) {
        super.init(frame: .zero)
        self.titleLabel.text = title
    
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(valueLabel)
    }
    
    private func setConstraints() {
        stackView.anchor(.fillSuperview())
    }
    
}
