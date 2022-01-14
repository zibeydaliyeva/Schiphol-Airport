//
//  AirportsViewController.swift
//  SchipholAiport
//
//  Created by Зибейда Алекперли on 14.11.21.
//

import UIKit
import MapKit

final class AirportsViewController: BaseViewController {
    
    private lazy var viewModel: AirportsViewModel = {
        return AirportsViewModel()
    }()
    
    private var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        return mapView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAirports()
    }
    
    override func setupUI() {
        super.setupUI()
        navigationItem.title = "Airports"
    
        mapView.delegate = self
    }
    
    override func addSubviews() {
        super.addSubviews()
        view.addSubview(mapView)
    }
    
    override func setConstraints() {
        super.setConstraints()
        mapView.anchor(.fillSuperview(isSafeArea:true))
    }
    
    
    // MARK: - Private
    
    private func fetchAirports() {
        viewModel.getAirports { [weak self] error in
            if let error = error {
                self?.errorHandler(error)
            } else {
                self?.setMarks()
            }
        }
    }
    
    private func setMarks() {
        for index in 0..<viewModel.airportsCount {
            let annotation = MKPointAnnotation()
            guard let airport = viewModel.getAirport(at: index)
            else { return }
            annotation.title = airport.name
            
            let coordinate = CLLocationCoordinate2D(latitude: airport.latitude,
                                                    longitude: airport.longitude)
            annotation.coordinate = coordinate
            mapView.addAnnotation(annotation)
        }
    }
    
}


//MARK: -MKMapViewDelegate

extension AirportsViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard !annotation.isKind(of: MKUserLocation.self) else { return nil }
    
        let identifier = "AirportIdentifier"
    
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
    
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        
        if let title = annotation.title, viewModel.isFurthestAirport(name: title) {
            annotationView?.image = UIImage(assetIdentifier: .farMarkIcon)
        } else {
            annotationView?.image = UIImage(assetIdentifier: .markIcon)
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        guard let latitude = view.annotation?.coordinate.latitude,
              let longitude = view.annotation?.coordinate.longitude
        else { return }
        
        let airportViewModel = viewModel.getAirportDetail(latitude: latitude,
                                                            longitude: longitude)

        let vc = AiportViewController()
        vc.viewModel = airportViewModel
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: false)
        mapView.deselectAnnotation(view.annotation, animated: true)
    }
   
}
