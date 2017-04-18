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

class SecondViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBAction func buttonPlacePicker(_ sender: UIButton) {
        let center = CLLocationCoordinate2D(latitude: 37.788204, longitude: -122.411937)
        let northEast = CLLocationCoordinate2D(latitude: center.latitude + 0.001, longitude: center.longitude + 0.001)
        let southWest = CLLocationCoordinate2D(latitude: center.latitude - 0.001, longitude: center.longitude - 0.001)
        let viewport = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
        let config = GMSPlacePickerConfig(viewport: viewport)
        let placePicker = GMSPlacePicker(config: config)
        
        placePicker.pickPlace(callback: {(place, error) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            
            if let place = place {
                self.nameLabel.text = place.name
                self.addressLabel.text = place.formattedAddress?.components(separatedBy: ", ")
                    .joined(separator: "\n")
            } else {
                self.nameLabel.text = "No place selected"
                self.addressLabel.text = ""
            }
        })        
    }
    override func loadView() {
        super.viewDidLoad()
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
        
        
}

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
//        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
    
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        }


    }

