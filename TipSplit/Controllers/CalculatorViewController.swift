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
    
    var selectedPctValue: Float = 0.1
    var numberOfPeople: Int = 2
    var enteredAmount: Float = 0.0
    var totalEach: Float = 0.0

    @IBAction func tipChanged(_ sender: UIButton) {
        highlightSelectedButton(sender)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let senderIntValue = Int(sender.value)
        splitNumberLabel.text = String(senderIntValue)
        numberOfPeople = senderIntValue
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        enteredAmount = Float(billTextField.text!) ?? enteredAmount
        let enteredAmountPlusTip = enteredAmount + (enteredAmount * selectedPctValue)
        totalEach = enteredAmountPlusTip / Float(numberOfPeople)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    func highlightSelectedButton(_ sender: UIButton) {
        billTextField.endEditing(true)
        // unselecting all buttons
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        // highlighting pressed button
        sender.isSelected = true
        // getting float value from button title
        let stringWihtNoPctChar = sender.currentTitle!.replacingOccurrences(of: "%", with: "")
        let pctValue = Float(stringWihtNoPctChar)
        let floatPctValue = (pctValue ?? 0) / 100.0
        selectedPctValue = floatPctValue
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultsViewController
        destinationVC.totalValue = String(format: "%.2f", totalEach)
        destinationVC.settingsText = getSettingText(people: numberOfPeople, pct: selectedPctValue)
    }
    
    func getSettingText(people: Int, pct: Float) -> String {
        let pctToInt = Int(pct * 100)
        let formattedText = String(format: "Spli between %d people, with %d%% tip.", people, pctToInt)
        return formattedText
    }
}

