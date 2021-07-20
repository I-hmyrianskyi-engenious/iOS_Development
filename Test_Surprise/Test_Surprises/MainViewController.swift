//
//  MainViewController.swift
//  Test_Surprises
//
//  Created by admin on 11.07.2021.
//
import RealmSwift
import UIKit


class Surprise : Object {
    @objc dynamic var  name : String = ""
    @objc dynamic var price : Double = 0
}

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var sum : Double = 0
    var sumChecked : Double = 0
    var difference : Double = 0
    let limit : Double = 100
    
    private let realm = try! Realm()
    private var surprises = [Surprise]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalPrice: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        surprises = realm.objects(Surprise.self).map({ $0 })
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        refresh()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return surprises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SurpriseCell") as? SurpriseCell else { return UITableViewCell() }
        
        cell.nameCell.text = surprises[indexPath.row].name
        cell.priceCell.text = String(surprises[indexPath.row].price)
        
        return cell
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
    
            tableView.beginUpdates()
            let removeItem = surprises.remove(at: indexPath.row)
            realm.beginWrite()
            realm.delete(removeItem)
            try! realm.commitWrite()
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
                if cell.accessoryType == .checkmark {
                     cell.accessoryType = .none
                } else {
                    cell.accessoryType = .checkmark
                }
            }
        if let  cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .checkmark {
                sum += surprises[indexPath.row].price
                sumChecked += surprises[indexPath.row].price
                totalPrice.text = String(sum)
            } else {
                sum -= surprises[indexPath.row].price
                totalPrice.text = String(sum)
            }
            
        }
       /*if let cell = tableView.cellForRow(at: indexPath) {
           if (sum > limit) {
                difference = sum - limit
                if difference == surprises[indexPath.row].price {
                        cell.accessoryType = .none
                        }
                    }
            totalPrice.text = String(sum)
            }
         if sum > limit {
             difference = sum - limit
             totalPrice.text = String(sum - difference)
             if difference == surprises[indexPath.row].price {
                 cell.accessoryType = .none
                 sum = sum - surprises[indexPath.row].price
                 totalPrice.text = String(sum)
             }
             
             }
         */
        }

    
    func refresh() {
        surprises = realm.objects(Surprise.self).map({ $0 })
        tableView.reloadData()
    }
}
