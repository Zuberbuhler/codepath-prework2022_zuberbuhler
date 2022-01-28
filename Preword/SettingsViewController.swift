//
//  SettingsViewController.swift
//  Preword
//
//  Created by Zuberbuhler on 1/27/22.
//

import UIKit


class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var tip1TextField: UITextField!
    @IBOutlet weak var tip2TextField: UITextField!
    @IBOutlet weak var tip3TextField: UITextField!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    @IBOutlet weak var tip1Label: UILabel!
    @IBOutlet weak var tip2Label: UILabel!
    @IBOutlet weak var tip3Label: UILabel!
    @IBOutlet weak var darkModeLabel: UILabel!
    @IBOutlet weak var percent1Label: UILabel!
    @IBOutlet weak var percent2Label: UILabel!
    @IBOutlet weak var percent3Label: UILabel!
    @IBOutlet weak var mainTopLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        let tip1 = defaults.string(forKey: "tip1") ?? "0"
        let components1 = tip1.components(separatedBy: "%")
        let tip2 = defaults.string(forKey: "tip2") ?? "0"
        let components2 = tip2.components(separatedBy: "%")
        let tip3 = defaults.string(forKey: "tip3") ?? "0"
        let components3 = tip3.components(separatedBy: "%")

        tip1TextField.text = components1[0]
        tip2TextField.text = components2[0]
        tip3TextField.text = components3[0]
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tip1TextFieldEdit(_ sender: Any) {
        let myColor: UIColor = .random
        UIView.animate(withDuration: 0.3, animations: {
            // Do animation
            self.view.backgroundColor = myColor
        })
        UIView.animate(withDuration: 0.5, animations: {
            // Do animation
            if(self.darkModeSwitch.isOn)
            {
                self.view.backgroundColor = UIColor.black
            }
            else{
                self.view.backgroundColor = UIColor.white
            }
        })
        
        let defaults = UserDefaults.standard

        // Set a Double value for some key.
        defaults.set(tip1TextField.text! + "%", forKey: "tip1")
        defaults.set(tip2TextField.text! + "%", forKey: "tip2")
        defaults.set(tip3TextField.text! + "%", forKey: "tip3")

        // Force UserDefaults to save.
        defaults.synchronize()
    }
    
    @IBAction func tip2TextFieldEdit(_ sender: Any) {
        let myColor: UIColor = .random
        UIView.animate(withDuration: 0.3, animations: {
            // Do animation
            self.view.backgroundColor = myColor
        })
        UIView.animate(withDuration: 0.5, animations: {
            // Do animation
            if(self.darkModeSwitch.isOn)
            {
                self.view.backgroundColor = UIColor.black
            }
            else{
                self.view.backgroundColor = UIColor.white
            }
        })
        
        let defaults = UserDefaults.standard

        // Set a Double value for some key.
        defaults.set(tip1TextField.text! + "%", forKey: "tip1")
        defaults.set(tip2TextField.text! + "%", forKey: "tip2")
        defaults.set(tip3TextField.text! + "%", forKey: "tip3")

        // Force UserDefaults to save.
        defaults.synchronize()
    }
    
    @IBAction func tip3TextFieldEdit(_ sender: Any) {
        let myColor: UIColor = .random
        UIView.animate(withDuration: 0.3, animations: {
            // Do animation
            self.view.backgroundColor = myColor
        })
        UIView.animate(withDuration: 0.5, animations: {
            // Do animation
            if(self.darkModeSwitch.isOn)
            {
                self.view.backgroundColor = UIColor.black
            }
            else{
                self.view.backgroundColor = UIColor.white
            }
        })
        
        let defaults = UserDefaults.standard

        // Set a Double value for some key.
        defaults.set(tip1TextField.text! + "%", forKey: "tip1")
        defaults.set(tip2TextField.text! + "%", forKey: "tip2")
        defaults.set(tip3TextField.text! + "%", forKey: "tip3")

        // Force UserDefaults to save.
        defaults.synchronize()
    }
    
    @IBAction func darkModeSwitchChange(_ sender: Any) {
        if(darkModeSwitch.isOn)
        {
            UIView.animate(withDuration: 0.7, animations: {
                self.view.backgroundColor = UIColor.black
                self.tip1Label.textColor = UIColor.white
                self.tip2Label.textColor = UIColor.white
                self.tip3Label.textColor = UIColor.white
                self.darkModeLabel.textColor = UIColor.white
                self.tip1TextField.textColor = UIColor.white
                self.tip1TextField.backgroundColor = UIColor.black
                self.tip1TextField.layer.borderColor = UIColor.white.cgColor
                self.tip1TextField.layer.borderWidth = 1
                self.tip1TextField.layer.cornerRadius = 15.0
                self.tip2TextField.textColor = UIColor.white
                self.tip2TextField.backgroundColor = UIColor.black
                self.tip2TextField.layer.borderColor = UIColor.white.cgColor
                self.tip2TextField.layer.borderWidth = 1
                self.tip2TextField.layer.cornerRadius = 15.0
                self.tip3TextField.textColor = UIColor.white
                self.tip3TextField.backgroundColor = UIColor.black
                self.tip3TextField.layer.borderColor = UIColor.white.cgColor
                self.tip3TextField.layer.borderWidth = 1
                self.tip3TextField.layer.cornerRadius = 15.0
                self.percent1Label.textColor = UIColor.white
                self.percent2Label.textColor = UIColor.white
                self.percent3Label.textColor = UIColor.white
                self.mainTopLabel.textColor = UIColor.white
                // Do animation
            })
            
        }
        else
        {
            UIView.animate(withDuration: 0.7, animations: {
                self.view.backgroundColor = UIColor.white
                self.tip1Label.textColor = UIColor.black
                self.tip2Label.textColor = UIColor.black
                self.tip3Label.textColor = UIColor.black
                self.darkModeLabel.textColor = UIColor.black
                self.tip1TextField.textColor = UIColor.black
                self.tip1TextField.backgroundColor = UIColor.white
                self.tip1TextField.layer.borderColor = UIColor.gray.cgColor
                self.tip2TextField.textColor = UIColor.black
                self.tip2TextField.backgroundColor = UIColor.white
                self.tip2TextField.layer.borderColor = UIColor.gray.cgColor
                self.tip2TextField.layer.borderWidth = 1
                self.tip2TextField.layer.cornerRadius = 15.0
                self.tip3TextField.textColor = UIColor.black
                self.tip3TextField.backgroundColor = UIColor.white
                self.tip3TextField.layer.borderColor = UIColor.gray.cgColor
                self.tip3TextField.layer.borderWidth = 1
                self.tip3TextField.layer.cornerRadius = 15.0
                self.percent1Label.textColor = UIColor.black
                self.percent2Label.textColor = UIColor.black
                self.percent3Label.textColor = UIColor.black
                self.mainTopLabel.textColor = UIColor.black
            })
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
