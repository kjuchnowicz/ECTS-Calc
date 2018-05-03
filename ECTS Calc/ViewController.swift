//
//  ViewController.swift
//  ECTS Calc
//
//  Created by Krzysztof Juchnowicz on 30.04.2018.
//  Copyright © 2018 Krzysztof Juchnowicz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pointsTextField: UITextField!
    let COST_OF_ONE_ECTS_POINT_IN_PLN = 55
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func calculatePressed(_ sender: Any) {
        let missingPointsText = self.pointsTextField.text ?? ""
        
        guard let numberOfMissingPoints = Int(missingPointsText) else {
            self.showAlert(messgage: "It was incorrect number")
            return
        }
        
        let costOfMissingPoints = numberOfMissingPoints * COST_OF_ONE_ECTS_POINT_IN_PLN
        
        if costOfMissingPoints > 0 {
            self.showAlert(messgage: "You must pay \(costOfMissingPoints) PLN :(")
        } else if costOfMissingPoints < 0 {
            self.showAlert(messgage: "Number of missing ECTS points cannot be negative number.")
        } else{
            self.showAlert(messgage: "You're a good student and you don't have to pay anthing :)")
        }
    }
    
    func showAlert(messgage: String){
        let alertController = UIAlertController(title: "Result", message:
            messgage, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}
