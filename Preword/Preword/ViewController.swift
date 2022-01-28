//
//  ViewController.swift
//  Preword
//
//  Created by Zuberbuhler on 1/27/22.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1
        )
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var partySizeLabel: UILabel!
    @IBOutlet weak var partySizeControl: UIStepper!
    @IBOutlet weak var perPersonAmountLabel: UILabel!
    @IBOutlet weak var sliderControl: UISlider!
    @IBOutlet weak var tipSliderAmountLabel: UILabel!
    
    var noSegmentSelected = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myColor: UIColor = .random
        // Do any additional setup after loading the view.
        UIView.animate(withDuration: 1, animations: {
            // Do animation
            self.view.backgroundColor = myColor
        })
        UIView.animate(withDuration: 1, animations: {
            // Do animation
            self.view.backgroundColor = UIColor.white
        })
        self.title = "Tip Calculator"
        
        let defaults = UserDefaults.standard

        // Set a Double value for some key.
        defaults.set(tipControl.titleForSegment(at: 0) , forKey: "tip1")
        defaults.set(tipControl.titleForSegment(at: 1) , forKey: "tip2")
        defaults.set(tipControl.titleForSegment(at: 2) , forKey: "tip3")
    

        // Force UserDefaults to save.
        defaults.synchronize()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let locale = Locale.current
        print(locale.regionCode!)
        
        print(locale.currencySymbol!)
        
        billAmountTextField.placeholder = locale.currencySymbol!
        
        billAmountTextField.becomeFirstResponder()
        
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        
        let defaults = UserDefaults.standard
        
        billAmountTextField.text = defaults.string(forKey: "billAmountTextField")

        var tip1 = defaults.string(forKey: "tip1") ?? "0"
        var tip2 = defaults.string(forKey: "tip2") ?? "0"
        var tip3 = defaults.string(forKey: "tip3") ?? "0"
        
        tipControl.setTitle(tip1, forSegmentAt: 0)
        tipControl.setTitle(tip2, forSegmentAt: 1)
        tipControl.setTitle(tip3, forSegmentAt: 2)
        
        
        if let i1 = tip1.firstIndex(of: "%") {
            tip1.remove(at: i1)
        }
        let tip1Double = Double(tip1)
        
        if let i2 = tip2.firstIndex(of: "%") {
            tip2.remove(at: i2)
        }
        let tip2Double = Double(tip2)
        
        if let i3 = tip3.firstIndex(of: "%") {
            tip3.remove(at: i3)
        }
        let tip3Double = Double(tip3)
        
        let smallest = min(min(tip1Double!, tip2Double!), tip3Double!)
        let largest = max(max(tip1Double!, tip2Double!), tip3Double!) + 10.0
        
        print("smallest", smallest)
        print("largest", largest)
        
        
        sliderControl.minimumValue = Float(smallest)
        sliderControl.maximumValue = Float(largest)
        
        if(noSegmentSelected){
            sliderControl.value = Float(smallest)
            tipSliderAmountLabel.text = String(format: "%.2f%%", sliderControl.value)
        }
        else{
            let tipPercentage = [tip1Double!, tip2Double!, tip3Double!]
            
            sliderControl.value = Float(tipPercentage[tipControl.selectedSegmentIndex])
            tipSliderAmountLabel.text = String(format: "%.2f%%", sliderControl.value)
        }
        
        let partySize = Int(partySizeControl.value)
        
        partySizeLabel.text = String(partySize)
        let bill = Double(billAmountTextField.text!) ?? 0
        
        var tip11 = tipControl.titleForSegment(at: 0)!
        var tip22 = tipControl.titleForSegment(at: 1)!
        var tip33 = tipControl.titleForSegment(at: 2)!
        
        print("tip1: " + String(tip11))
        print("tip2: " + String(tip22))
        print("tip3: " + String(tip33))
        
        if let i1 = tip11.firstIndex(of: "%") {
            tip11.remove(at: i1)
        }
        let tip11Double = Double(tip11)
        
        if let i2 = tip22.firstIndex(of: "%") {
            tip22.remove(at: i2)
        }
        let tip22Double = Double(tip22)
        
        if let i3 = tip33.firstIndex(of: "%") {
            tip33.remove(at: i3)
        }
        let tip33Double = Double(tip33)
        
        print("tip1Double: " + String(tip11Double!))
        print("tip2Double: " + String(tip22Double!))
        print("tip3Double: " + String(tip33Double!))
        
        let tipPercentages = [tip11Double!, tip22Double!, tip33Double!]
        
        
        let sliderValue = Double(sliderControl.value)
        
        var tip = 0.0
        
        if (noSegmentSelected)
        {
            tip = bill * (sliderValue/100.00)
        }
        else
        {
            tip = bill * tipPercentages[tipControl.selectedSegmentIndex] / 100.0
        }
        
        let total = bill + tip
        
        tipAmountLabel.text = String(format: locale.currencySymbol! + "%.2f", tip)
        
        totalLabel.text = String(format: locale.currencySymbol! + "%.2f", total)
        
        perPersonAmountLabel.text = String(format: locale.currencySymbol! + "%.2f", total / Double(partySize))
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    @IBAction func sliderEditDone(_ sender: Any) {
        let myColor: UIColor = .random
        UIView.animate(withDuration: 0.3, animations: {
            // Do animation
            self.view.backgroundColor = myColor
        })
        UIView.animate(withDuration: 0.5, animations: {
            // Do animation
            self.view.backgroundColor = UIColor.white
        })
    }
    @IBAction func sliderTouchDragExit(_ sender: Any) {
        let myColor: UIColor = .random
        UIView.animate(withDuration: 0.3, animations: {
            // Do animation
            self.view.backgroundColor = myColor
        })
        UIView.animate(withDuration: 0.5, animations: {
            // Do animation
            self.view.backgroundColor = UIColor.white
        })
    }
    @IBAction func sliderTouchDown(_ sender: Any) {
        let myColor: UIColor = .random
        UIView.animate(withDuration: 0.3, animations: {
            // Do animation
            self.view.backgroundColor = myColor
        })
        UIView.animate(withDuration: 0.5, animations: {
            // Do animation
            self.view.backgroundColor = UIColor.white
        })
    }
    
    @IBAction func sliderTouchDragEnter(_ sender: Any) {
        let myColor: UIColor = .random
        UIView.animate(withDuration: 0.3, animations: {
            // Do animation
            self.view.backgroundColor = myColor
        })
        UIView.animate(withDuration: 0.5, animations: {
            // Do animation
            self.view.backgroundColor = UIColor.white
        })
    }
    
    
    @IBAction func tipSliderEdit(_ sender: Any) {
        
        let sliderValue = Double(sliderControl.value)
        
        noSegmentSelected = true
        tipControl.selectedSegmentIndex = UISegmentedControl.noSegment
        
        let partySize = Int(partySizeControl.value)
        
        partySizeLabel.text = String(partySize)
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let tip = sliderValue / 100.00 * bill
        
        let total = bill + tip
        
        let locale = Locale.current
        print(locale.regionCode!)
        
        print(locale.currencySymbol!)
        
        tipAmountLabel.text = String(format: locale.currencySymbol! + "%.2f", tip)
        
        totalLabel.text = String(format: locale.currencySymbol! + "%.2f", total)
        
        perPersonAmountLabel.text = String(format: locale.currencySymbol! + "%.2f", total / Double(partySize))
        
        tipSliderAmountLabel.text = String(format: "%.2f%%", sliderValue)
    }
    
    @IBAction func partySizeEdit(_ sender: Any) {
        let myColor: UIColor = .random
        UIView.animate(withDuration: 0.3, animations: {
            // Do animation
            self.view.backgroundColor = myColor
        })
        UIView.animate(withDuration: 0.5, animations: {
            // Do animation
            self.view.backgroundColor = UIColor.white
        })
        
        let partySize = Int(partySizeControl.value)
        
        partySizeLabel.text = String(partySize)
        let bill = Double(billAmountTextField.text!) ?? 0
        
        var tip1 = tipControl.titleForSegment(at: 0)!
        var tip2 = tipControl.titleForSegment(at: 1)!
        var tip3 = tipControl.titleForSegment(at: 2)!
        
        print("tip1: " + String(tip1))
        print("tip2: " + String(tip2))
        print("tip3: " + String(tip3))
        
        if let i1 = tip1.firstIndex(of: "%") {
            tip1.remove(at: i1)
        }
        let tip1Double = Double(tip1)
        
        if let i2 = tip2.firstIndex(of: "%") {
            tip2.remove(at: i2)
        }
        let tip2Double = Double(tip2)
        
        if let i3 = tip3.firstIndex(of: "%") {
            tip3.remove(at: i3)
        }
        let tip3Double = Double(tip3)
        
        print("tip1Double: " + String(tip1Double!))
        print("tip2Double: " + String(tip2Double!))
        print("tip3Double: " + String(tip3Double!))
        
        let tipPercentages = [tip1Double!, tip2Double!, tip3Double!]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex] / 100.0
        
        let total = bill + tip
        
        let locale = Locale.current
        print(locale.regionCode!)
        
        print(locale.currencySymbol!)
        
        tipAmountLabel.text = String(format: locale.currencySymbol! + "%.2f", tip)
        
        totalLabel.text = String(format: locale.currencySymbol! + "%.2f", total)
        
        perPersonAmountLabel.text = String(format: locale.currencySymbol! + "%.2f", total / Double(partySize))
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let myColor: UIColor = .random
        UIView.animate(withDuration: 0.3, animations: {
            // Do animation
            self.view.backgroundColor = myColor
        })
        UIView.animate(withDuration: 0.5, animations: {
            // Do animation
            self.view.backgroundColor = UIColor.white
        })
        noSegmentSelected = false
        let partySize = Int(partySizeControl.value)
        
        partySizeLabel.text = String(partySize)
        let bill = Double(billAmountTextField.text!) ?? 0
        
        var tip1 = tipControl.titleForSegment(at: 0)!
        var tip2 = tipControl.titleForSegment(at: 1)!
        var tip3 = tipControl.titleForSegment(at: 2)!
        
        print("tip1: " + String(tip1))
        print("tip2: " + String(tip2))
        print("tip3: " + String(tip3))
        
        if let i1 = tip1.firstIndex(of: "%") {
            tip1.remove(at: i1)
        }
        let tip1Double = Double(tip1)
        
        if let i2 = tip2.firstIndex(of: "%") {
            tip2.remove(at: i2)
        }
        let tip2Double = Double(tip2)
        
        if let i3 = tip3.firstIndex(of: "%") {
            tip3.remove(at: i3)
        }
        let tip3Double = Double(tip3)
        
        print("tip1Double: " + String(tip1Double!))
        print("tip2Double: " + String(tip2Double!))
        print("tip3Double: " + String(tip3Double!))
        
        let tipPercentages = [tip1Double!, tip2Double!, tip3Double!]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex] / 100.0
        
        let total = bill + tip
        
        let locale = Locale.current
        print(locale.regionCode!)
        
        print(locale.currencySymbol!)
        
        tipAmountLabel.text = String(format: locale.currencySymbol! + "%.2f", tip)
        
        totalLabel.text = String(format: locale.currencySymbol! + "%.2f", total)
        
        perPersonAmountLabel.text = String(format: locale.currencySymbol! + "%.2f", total / Double(partySize))
        
        tipSliderAmountLabel.text = String(format: "%.2f%%", tipPercentages[tipControl.selectedSegmentIndex])
        
            
        UIView.animate(withDuration: 0.5, animations: {
          self.sliderControl.setValue(Float(tipPercentages[self.tipControl.selectedSegmentIndex]), animated:true)
        })
        
        
        
    }
    
    @IBAction func billAmountEdited(_ sender: Any) {
        let myColor: UIColor = .random
        UIView.animate(withDuration: 0.3, animations: {
            // Do animation
            self.view.backgroundColor = myColor
        })
        UIView.animate(withDuration: 0.5, animations: {
            // Do animation
            self.view.backgroundColor = UIColor.white
        })
        let partySize = Int(partySizeControl.value)
        
        partySizeLabel.text = String(partySize)
        let bill = Double(billAmountTextField.text!) ?? 0
        
        var tip1 = tipControl.titleForSegment(at: 0)!
        var tip2 = tipControl.titleForSegment(at: 1)!
        var tip3 = tipControl.titleForSegment(at: 2)!
        
        print("tip1: " + String(tip1))
        print("tip2: " + String(tip2))
        print("tip3: " + String(tip3))
        
        if let i1 = tip1.firstIndex(of: "%") {
            tip1.remove(at: i1)
        }
        let tip1Double = Double(tip1)
        
        if let i2 = tip2.firstIndex(of: "%") {
            tip2.remove(at: i2)
        }
        let tip2Double = Double(tip2)
        
        if let i3 = tip3.firstIndex(of: "%") {
            tip3.remove(at: i3)
        }
        let tip3Double = Double(tip3)
        
        print("tip1Double: " + String(tip1Double!))
        print("tip2Double: " + String(tip2Double!))
        print("tip3Double: " + String(tip3Double!))
        
        let tipPercentages = [tip1Double!, tip2Double!, tip3Double!]
        
        
        let sliderValue = Double(sliderControl.value)
        
        var tip = 0.0
        
        if (noSegmentSelected)
        {
            tip = bill * (sliderValue/100.00)
        }
        else
        {
            tip = bill * tipPercentages[tipControl.selectedSegmentIndex] / 100.0
        }
        
        let total = bill + tip
        
        let locale = Locale.current
        print(locale.regionCode!)
        
        print(locale.currencySymbol!)
        
        tipAmountLabel.text = String(format: locale.currencySymbol! + "%.2f", tip)
        
        totalLabel.text = String(format: locale.currencySymbol! + "%.2f", total)
        
        perPersonAmountLabel.text = String(format: locale.currencySymbol! + "%.2f", total / Double(partySize))
        
        let defaults = UserDefaults.standard
        
        defaults.set(billAmountTextField.text, forKey: "billAmountTextField")
        
        defaults.synchronize()
    }
    
}

