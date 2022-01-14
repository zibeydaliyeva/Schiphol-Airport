//
//  AiportViewController.swift
//  SchipholAiport
//
//  Created by Зибейда Алекперли on 14.11.21.
//

import UIKit

final class AiportViewController: BaseViewController {
    
    var viewModel: AirportViewModel?
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private let contentView: UIView = {
        return UIView()
    }()
    
    private lazy var textStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.idItemView,
            self.latitudeItemView,
            self.longitudeItemView,
            self.nameItemView,
            self.cityItemView,
            self.countryItemView,
            self.closestItemView,
            self.distanceItemView])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 14
        return stackView
    }()
    
    private let idItemView: ItemView = {
        let view = ItemView(title: "ID")
        return view
    }()
    
    private let latitudeItemView: ItemView = {
        let view = ItemView(title: "Latitude")
        return view
    }()
    
    private let longitudeItemView: ItemView = {
        let view = ItemView(title: "Longitude")
        return view
    }()
    
    private let nameItemView: ItemView = {
        let view = ItemView(title: "Name")
        return view
    }()
    
    private let cityItemView: ItemView = {
        let view = ItemView(title: "City")
        return view
    }()
    
    private let countryItemView: ItemView = {
        let view = ItemView(title: "Country ID")
        return view
    }()
    
    private let closestItemView: ItemView = {
        let view = ItemView(title: "Closest Airport")
        return view
    }()
    
    private let distanceItemView: ItemView = {
        let view = ItemView(title: "Distance")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setViewData()
    }
    
    override func addSubviews() {
        super.addSubviews()
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(textStack)
    }
    
    override func setConstraints() {
        super.setConstraints()
    
        scrollView.anchor(.fillSuperview())
            
        contentView.anchor(
            .fillSuperview(),
            .widthEqual(scrollView.widthAnchor))
        
        textStack.anchor(
            .top(20),
            .bottom(),
            .leading(20),
            .trailing(-20))
    }
    
    
    // MARK: - Private
    
    private func setViewData() {
        guard let viewModel = viewModel else { return }
        
        self.navigationItem.title = viewModel.name
        
        idItemView.value = viewModel.id
        latitudeItemView.value = String(viewModel.latitude)
        longitudeItemView.value = String(viewModel.longitude)
        nameItemView.value = viewModel.name
        cityItemView.value = viewModel.city
        countryItemView.value = viewModel.countryId
        closestItemView.value = viewModel.closestAirportName
        distanceItemView.value = viewModel.distance
    }

}
