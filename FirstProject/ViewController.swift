//
//  ViewController.swift
//  FirstProject
//
//  Created by Bakar Kharabadze on 4/2/24.
//

import UIKit

class ViewController: UIViewController {
    //MARK: @IBOutlets
    @IBOutlet private weak var mainLabel: UILabel!
    @IBOutlet private weak var mainSwitch: UISwitch!
    @IBOutlet private weak var firstTxt: UITextField!
    @IBOutlet private weak var secondTxt: UITextField!
    @IBOutlet private weak var mainButton: UIButton!
    @IBOutlet private weak var answerLabel: UILabel!
    @IBOutlet private weak var errorLabel: UILabel!
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
}
    //MARK: Actions
    @IBAction private func buttonAction(_ sender: Any) {
        answerLabel.text = "პასუხი: "
        
        guard let firstTextfield = firstTxt.text,
              let secondTextfield = secondTxt.text,
              let firstIntValue = Int(firstTextfield),
              let secondIntValue = Int(secondTextfield) else {
            errorLabel.text = "გთხოვთ შეიყვანოთ რიცხვი"
            return
        }
        
        guard firstIntValue > 0,
              secondIntValue > 0 else {
            errorLabel.text = "შეყვანილი რიცხვი უნდა იყოს 0-ზე მეტი"
            return
        }
        
        errorLabel.text = ""
        
        answerLabel.text = mainSwitch.isOn
        ? "პასუხი: \(gcd(firstIntValue, secondIntValue))"
        : "პასუხი: \(lcm(firstIntValue, secondIntValue))"
        
    }
    
    @IBAction private func switchAction(_ sender: Any) {
        mainLabel.text = mainSwitch.isOn ? "უდიდესი საერთო გამყოფი" : "უმცირესი საერთო გამყოფი"
    }
    
    //MARK: Private methods
    private func gcd(_ num1: Int, _ num2: Int) -> String {
        num2 == 0 ? String(num1): gcd(num2, num1 % num2)
    }
    
    private func lcm(_ num1: Int, _ num2: Int) -> String {
        String((num1 * num2) / (Int(gcd(num1, num2)) ?? 1))
    }
    
}

