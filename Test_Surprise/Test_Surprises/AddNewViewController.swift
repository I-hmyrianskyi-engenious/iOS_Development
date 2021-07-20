//
//  AddNewViewController.swift
//  Test_Surprises
//
//  Created by admin on 11.07.2021.
//
import RealmSwift
import UIKit


class AddNewViewController: UIViewController {
    
    private let realm = try! Realm()

    @IBOutlet weak var enterName: UITextField!
    @IBOutlet weak var enterPrice: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func addSurprise(_ sender: UIBarButtonItem) {
                
                addData()
                navigationController?.popToRootViewController(animated: true)
        
    }
    
    func addData() {
        realm.beginWrite()
        
        let newSurprise = Surprise()
        newSurprise.name = enterName.text!
        newSurprise.price = Double(enterPrice.text!)!
        realm.add(newSurprise)
        try! realm.commitWrite()
        
    }
    
}

