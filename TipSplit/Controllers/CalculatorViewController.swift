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
    
    var selectedPct: UIButton?

    @IBAction func tipChanged(_ sender: UIButton) {
        highlightSelectedButton(sender)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
    }
    
    func highlightSelectedButton(_ sender: UIButton) {
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
        print("\(floatPctValue)")
        selectedPct = sender
    }
}

