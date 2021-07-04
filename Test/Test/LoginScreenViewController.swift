//
//  ViewController.swift
//  Test_VertageLab
//
//  Created by admin on 24.06.2021.
//

import UIKit


class LoginScreenViewController: UIViewController {

    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

            let MapScreenViewController = segue.destination as! MapScreenViewController

                MapScreenViewController.userEmail = emailText.text!
        }
    
    @IBAction func loginButton(_ sender: UIButton) {
        checkEmpty()
    }
    func checkEmpty() {
        if (emailText.text == "" || passwordText.text == "") {
           let alert = UIAlertController(title: "Error", message: "Enter Your Email or Password", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel) { (action) in }
            
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        } else {
             return
        }
        
    }

}

