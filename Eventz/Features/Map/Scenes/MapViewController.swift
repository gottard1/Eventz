//
//  MapViewController.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 06/11/23.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
    let id: String
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct MapViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController { return MapViewController() }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

final class MapViewController: UIViewController {
    
    private var mapView: MKMapView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().isTranslucent = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupGesture() {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        mapView.addGestureRecognizer(longPressGesture)
    }
    
    private func setupLayout() {
        mapView.frame = view.bounds
        mapView.delegate = self
        view.addSubview(mapView)
    }
    
    @objc func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began {
            let touchPoint = gestureRecognizer.location(in: mapView)
            let coordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
            let annotation = MKPointAnnotation()
            
            annotation.coordinate = coordinate
            mapView.addAnnotation(annotation)
            
        }
    }
    
}

extension MapViewController: MKMapViewDelegate { }
