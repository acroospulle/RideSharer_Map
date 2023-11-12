//
//  MapViewController.swift
//  RideSharer
//
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if CLLocationManager.locationServicesEnabled() {
            checkLocationAuthorization()
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
        case .denied:
            presentDeniedAccessAlert()
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            mapView.showsUserLocation = true
        case .restricted:
            presentDeniedAccessAlert()
        case .authorizedAlways:
            break
        @unknown default:
            break
        }
    }
    
    func presentDeniedAccessAlert() {
        let alert = UIAlertController(title: "Authorization Denied",
                                      message: "Please turn on location permission",
                                      preferredStyle: .alert)
        let okAlert = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAlert)
        
        present(alert, animated: true)
    }
}
