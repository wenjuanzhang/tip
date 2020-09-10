//
//  ViewController.swift
//  tip
//
//  Created by Wenjuan Zhang on 9/1/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var showSliderValue: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var numberSplits: UITextField!
    @IBOutlet weak var eachPays: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    

    @IBAction func calculateTip(_ sender: Any) {
        // Get initial bill amount and calculate tips
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.10, 0.15, 0.18, 0.20]
        
        // Caluculate tip and total
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update the tip and total label
        tipLabel.text = String(format: "$%.2f",tip)
        totalLabel.text = String(format: "$%.2f",total)
    }
    @IBAction func splitBill(_ sender: Any) {
        // Get initial bill amount and calculate tips
        let bill = Double(billAmountTextField.text!) ?? 0
        let numSplits = Double(numberSplits.text!) ?? 1
        let tipPercentages = [0.10, 0.15, 0.18, 0.20]
        
        // Caluculate tip and total
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update the tip and total label
        tipLabel.text = String(format: "$%.2f",tip)
        totalLabel.text = String(format: "$%.2f",total)
        eachPays.text = String(format:"$%.2f",total/numSplits)
    }
    @IBAction func calculateTipfromSlider(_ sender: Any) {
        // Get initial bill amount and calculate tips
        let bill = Double(billAmountTextField.text!) ?? 0
        let numSplits = Double(numberSplits.text!) ?? 1
        let tipPercentages = Double(Int(tipPercentageSlider.value))
        
        // Caluculate tip and total
        let tip = bill * tipPercentages / 100
        let total = bill + tip
        
        // Update the tip and total label
        tipLabel.text = String(format: "$%.2f",tip)
        showSliderValue.text = String(format: "%i%",Int(tipPercentageSlider.value))
        totalLabel.text = String(format: "$%.2f",total)
        eachPays.text = String(format:"$%.2f",total/numSplits)    }
}

