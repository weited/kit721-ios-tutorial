//
//  ViewController.swift
//  MyFirstApp
//
//  Created by mobiledev on 6/5/2022.
//

import UIKit

class ViewController: UIViewController {
    
  
    @IBOutlet weak var btnNextView: UIButton!
    @IBOutlet var nameField: UITextField!
    @IBAction func nameEntered(_ sender: Any) {
        print("User typed \(nameField.text!)")
        self.performSegue(withIdentifier: "goToSecondScreen", sender: nil)
    }
    
    @IBAction func goToNextView(_ sender: Any) {
        self.performSegue(withIdentifier: "goToThirdScreen", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecondScreen"
        {
            if let secondSreen = segue.destination as? SecondViewController {
                secondSreen.nameFromPreviousView = nameField.text!
            }
        }
    }


}

