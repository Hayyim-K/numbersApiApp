//
//  MainViewController.swift
//  numbersApiApp
//
//  Created by vitasiy on 16.11.2020.
//

import UIKit


class MainViewController: UIViewController {
    
    var number: Number!
    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var contextLabel: UILabel!
    
    
    private func translation(text: String) {
        NetworkManager.shared.getTranslate3(incomingText: text) {
            resultData in
            DispatchQueue.main.async {
                var text = "\(resultData)"
                let fromIndex = text.lastIndex(of: "(") ?? text.startIndex
                text = String(text.suffix(from: fromIndex)).components(separatedBy: "(").last?.components(separatedBy: ")").first ?? "."
                print(text)
                
                self.contextLabel.text = text
            }
        }
    }
    
    @IBAction func tryButtonPressed() {
        
        let numberFromTextField = numberTextField.text
        if Int(numberFromTextField ?? "") != nil {
            Number.getData(numberFromTextField: numberFromTextField!) {
                number in
                DispatchQueue.main.async {
                    self.number = number
                }
                
                let text = number.text ?? "error"
                self.translation(text: text)
            }
            
        } else {
            contextLabel.text = "Input integer number only, pls!"
        }
        
    }
    
    @IBAction func randomButtonPressed() {
        
        Number.getData(numberFromTextField: "random") {
            number in
            self.number = number
            let text = self.number.text ?? "some problem"
            self.translation(text: text)
        }
    }
    
    
}
