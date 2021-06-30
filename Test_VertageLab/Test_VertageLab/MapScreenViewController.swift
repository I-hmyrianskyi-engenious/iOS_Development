//
//  MapScreenViewController.swift
//  Test_VertageLab
//
//  Created by admin on 24.06.2021.
//

import UIKit
import MapKit



class MapScreenViewController: UIViewController, UITableViewDataSource {
    
    var userEmail = ""
    var places = [Place]()
    //var points = [PointOnMap]()
    let url = URL(string: "https://2fjd9l3x1l.api.quickmocker.com/kyiv/places")
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleEmail: UINavigationItem!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleEmail.title = userEmail
        downloadData()
        //downloadCoordinate()
    }
    
    
    func downloadData() {
        URLSession.shared.dataTask(with: url!) { data, urlResponse, error in
            do {
                let decoder = JSONDecoder()
                let downoadPlaces = try decoder.decode(Places.self, from: data!)
                self.places = downoadPlaces.places
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
    
    /*
    func downloadCoordinate() {
        URLSession.shared.dataTask(with: url!) { (data, urlResonse, error) in
            do {
                let decoder1 = MKGeoJSONDecoder()
                let downloadPoints = try decoder1.decode(data!)
                
            } catch {
                print("Error")
            }
        }
        
    }*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell") as? PlaceCell else { return UITableViewCell() }
        cell.idPlace.text = String(places[indexPath.row].id)
        cell.namePlace.text = places[indexPath.row].name
        return cell
    }
    
   
    
}
