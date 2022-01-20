//
//  ViewController.swift
//  Prework
//
//  Created by Aria Firooz on 1/1/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var partySizeLabel: UILabel!
    
    @IBOutlet weak var sizeStepperColor: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Dinner Calc"
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.billAmountTextField.becomeFirstResponder()
    }

    @IBAction func partySizeStepper(_ sender: UIStepper) {
        partySizeLabel.text = Int(sender.value).description
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let partySize = Double(partySizeLabel.text!) ?? 0
        let total = (bill + tip) / partySize
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)

    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
}
    
    @IBAction func darkModeSwitch(_ sender: UISwitch) {
        if sender.isOn {
            overrideUserInterfaceStyle = .dark
            self.view.backgroundColor = UIColor.black
            self.billAmountTextField.backgroundColor = UIColor.white
            self.sizeStepperColor.backgroundColor = UIColor.red
            self.billAmountTextField.textColor = UIColor.black
        }
        else {
            overrideUserInterfaceStyle = .light
            self.view.backgroundColor = UIColor.white
            self.billAmountTextField.backgroundColor = UIColor.white
            self.sizeStepperColor.backgroundColor = UIColor.green
        }
    }
    
    
}
