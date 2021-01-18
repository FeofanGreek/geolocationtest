//
//  ViewController.swift
//  GeolocationTest
//
//  Created by apple on 29.05.2020.
//  Copyright © 2020 Koldashev.Ru. All rights reserved.
//
import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate{
   //загружаем локейшн мэнеджер
    private var locationManager:CLLocationManager?
   //создаем экранчик для отображения координат
    private let latLngLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemFill
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 26)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        latLngLabel.frame = CGRect(x: 20, y: view.bounds.height / 2 - 50, width: view.bounds.width - 40, height: 100)
        view.addSubview(latLngLabel)
        //запускаем функцию определения места
        getUserLocation()
    }
    func getUserLocation() {
        locationManager = CLLocationManager()
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
        locationManager?.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            //вставляем координаты во что то
            latLngLabel.text = "Lat : \(location.coordinate.latitude) \nLng : \(location.coordinate.longitude)"
        }
    }
}
