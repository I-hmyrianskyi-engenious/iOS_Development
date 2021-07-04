//
//  Place.swift
//  Test_VertageLab
//
//  Created by admin on 28.06.2021.
//

import UIKit
import MapKit


class Places : Codable {
    let places : [Place]
    
    init(places : [Place]) {
        self.places = places
    }
}

class Place : Codable{
    let id : Int
    let name : String
    
    init(id : Int, name : String) {
        self.id = id
        self.name = name
    }
}
/*
class PointOnMap  : NSObject, MKAnnotation {
    let coordinate : CLLocationCoordinate2D
    
    init(coordinate : CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
*/
