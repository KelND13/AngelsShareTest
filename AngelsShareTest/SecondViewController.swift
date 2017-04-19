//
//  SecondViewController.swift
//  AngelsShareTest
//
//  Created by Kelly Dickerson on 4/13/17.
//  Copyright © 2017 Kelly Dickerson. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlacePicker
import GooglePlaces
import CoreLocation

class SecondViewController: UIViewController, CLLocationManagerDelegate {
    
    var placePicker: GMSPlacePicker!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var placesClient: GMSPlacesClient!
    var locationManager = CLLocationManager()

    
//    override func loadView() {
//        super.viewDidLoad()
//        
//        print("did it work?")
        /* Maps:
        // Do any additional setup after loading the view, typically from a nib.
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        //Creates marker for map:
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        */
        
//        func pickPlace(_ sender: UIButton) {
//            let config = GMSPlacePickerConfig(viewport: nil)
//            let placePicker = GMSPlacePicker(config: config)
//            
//            placePicker.pickPlace(callback: { (place, error) -> Void in
//                if let error = error {
//                    print("Pick Place error: \(error.localizedDescription)")
//                    return
//                }
//                
//                guard let place = place else {
//                    print("No place selected")
//                    return
//                }
//                
//                print("Place name \(place.name)")
//                print("Place address \(place.formattedAddress)")
//                print("Place attributions \(place.attributions)")
//            })
//        }
        
        


    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.startUpdatingLocation()
        placesClient = GMSPlacesClient.shared()
        // Do any additional setup after loading the view, typically from a nib.
//        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
//        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
    
    }
    
    @IBAction func getCurrentPlace(_ sender: UIButton) {
        let config = GMSPlacePickerConfig(viewport: nil)
        let placePicker = GMSPlacePicker(config: config)
        
        placePicker.pickPlace(callback: { (place, error) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            
            guard let place = place else {
                print("No place selected")
                return
            }
            
            print("Place name \(place.name)")
            print("Place address \(place.formattedAddress ?? <#default value#>)")
            print("Place attributions \(place.attributions ?? <#default value#>)")
        })
    }

        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        }


}


