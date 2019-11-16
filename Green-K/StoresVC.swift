//
//  StoresVC.swift
//  Green-K
//
//  Created by Wissa Azmy on 11/16/19.
//  Copyright © 2019 Wissa Azmy. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class DroppablePin: NSObject, MKAnnotation {
    dynamic var coordinate: CLLocationCoordinate2D
    var identifier: String
    
    init(coordinate: CLLocationCoordinate2D, identifier: String) {
        self.coordinate = coordinate
        self.identifier = identifier
        super.init()
    }
}

class StoresVC: UIViewController {
    var locationManager = CLLocationManager()
    let authorizationStatus = CLLocationManager.authorizationStatus()
    var lat: CLLocationDegrees?
    var long: CLLocationDegrees?

    var mapView = MKMapView()
    var setButton: UIButton!
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "K Stores"
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        activateConstraints()
        mapView.delegate = self
        locationManager.delegate = self
        
//        addLongPress()
        configureLocationServices()
        addAnnotation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        centerMapOnUserLocation()
    }
    
    // MARK: - Actions
    @objc func doneBtnTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Private Methods
    fileprivate func addAnnotation(_ coordinates: CLLocationCoordinate2D? = nil) {
        // Create annotation and add it to the mapView 24.933&lat=60.164
        let coordinates2 = CLLocationCoordinate2D(latitude: 60.164, longitude: 24.933)
        let annotation = DroppablePin(coordinate: coordinates2, identifier: "droppablePin")
        lat = annotation.coordinate.latitude
        long = annotation.coordinate.longitude
        mapView.addAnnotation(annotation)
    }
    
    @objc private func dropPen(sender: UITapGestureRecognizer) {
        // remove previous annotations before adding a new one
        removePinAndResetData()
        // Get the touchPoint of the double tap gesture
        let touchPoint = sender.location(in: mapView)
        
        // This will convert the double tap touchPoint to coordinate from the MapView
        let touchCoordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
        addAnnotation(touchCoordinate)
    }
    
    private func removePinAndResetData() {
        mapView.annotations.forEach( {mapView.removeAnnotation($0)} )
    }
    
    fileprivate func activateConstraints() {
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100)
        ])
    }
}




// MARK: - Map View Delegate
extension StoresVC: MKMapViewDelegate {
    func centerMapOnUserLocation() {
        guard let coordinate = locationManager.location?.coordinate else {
            print("Couldn't get user location coordinates.")
            return
        }
        print(coordinate)
        // regionRadius * 2.0 for the space above and under the location indicator,
        // and the same for right and left
        addAnnotation(coordinate)
        
        // Recenter the mapView to the new annotation
        let coordinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 2.000, longitudinalMeters: 2.000)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}

// MARK: - Location Manager Delegate
extension StoresVC: CLLocationManagerDelegate {
    func configureLocationServices() {
        if authorizationStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        } else {
            // If authorization is already granted or denied
            return
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        centerMapOnUserLocation()
    }
}

// MARK: - Gesture Recognizer Delegate
extension StoresVC: UIGestureRecognizerDelegate {
    private func addLongPress() {
        // The longPress gestureRecognizer will pass itself automatically to the dropPen
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(dropPen(sender: )))
        longPress.minimumPressDuration = 1
        longPress.delegate = self
        mapView.addGestureRecognizer(longPress)
    }
}
