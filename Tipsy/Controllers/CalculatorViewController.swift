//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    
    var calculatorTip = CalculatorTip()
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if billTextField.text != ""{
            calculatorTip.billValue = Double(billTextField.text!) ?? 0.0
            calculatorTip.calculate(bill: calculatorTip.billValue, tip: calculatorTip.tip, numberOfPeople: calculatorTip.numberOfPeople)
        }
        self.performSegue(withIdentifier: "TransitionToView", sender: self)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        //Make the button that triggered the IBAction selected.
        sender.isSelected = true
        
        //Get the current title of the button that was pressed.
        let buttonTitle = sender.currentTitle!
        
        //Remove the last character (%) from the title then turn it back into a String.
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        
        //Turn the String into a Double.
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        
        //Divide the percent expressed out of 100 into a decimal e.g. 10 becomes 0.1
        calculatorTip.tip = buttonTitleAsANumber / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        calculatorTip.numberOfPeople = Int(sender.value)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TransitionToView"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.tip = calculatorTip.getTipValue()
            destinationVC.numberOfPeople = calculatorTip.getNumberOfPeople()
            destinationVC.resultTotal = calculatorTip.getTotalResult()
        }
    }
}

