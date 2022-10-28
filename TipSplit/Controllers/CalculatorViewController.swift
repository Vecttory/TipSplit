//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var stepperInput: UIStepper!
    
    var tipCalculatorBrain = TipCalculatorBrain()

    var selectedPctValue: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // This matches with the default selected tip percenta in the UI
        selectedPctValue = 0.1
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        // unselecting all buttons
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        // highlighting pressed button
        sender.isSelected = true
        // getting float value from button title
        selectedPctValue = percentageStringToFloat(sender.currentTitle!)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let senderIntValue = Int(sender.value)
        splitNumberLabel.text = String(senderIntValue)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let amount = Float(billTextField.text!) ?? 0.0
        let people = Int(stepperInput.value)
        
        tipCalculatorBrain.calculateTip(amount: amount, people: people, percentage: selectedPctValue)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalValue = tipCalculatorBrain.getTotalEachToString()
            destinationVC.settingsText = tipCalculatorBrain.getMessage()
        }
    }
    
    func percentageStringToFloat(_ percentage: String) -> Float {
        let stringWihtNoPctChar = percentage.replacingOccurrences(of: "%", with: "")
        let pctValue = Float(stringWihtNoPctChar)
        let floatPctValue = (pctValue ?? 0) / 100.0
        return floatPctValue
    }
    
}

