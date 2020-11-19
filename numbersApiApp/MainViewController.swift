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
    
    
    @IBAction func tryButtonPressed() {
        
        let numberFromTextField = numberTextField.text
        if Int(numberFromTextField ?? "") != nil {
            Number.getData(numberFromTextField: numberFromTextField!) {
                number in
                DispatchQueue.main.async {
                    self.number = number
                    self.contextLabel.text = self.number.text
                }
           
                //ЗДЕСЬ ПЛАНИРОВАЛОСЬ ВЫЗЫВАТЬ МЕТОД getTranslate, который передавал бы английский текст в специальную модель, паковал в JSON и отправлял для перевода POST запростом ...
                
                NetworkManager.shared.getTranslate2(incomingText: "hello") {
                text in
                DispatchQueue.main.async {
                    self.contextLabel.text = "\(text)"
                }
                }
                
            }
            
        } else {
            contextLabel.text = "Input integer number only, pls!"
        }
        
    }
    
    @IBAction func randomButtonPressed() {
        
        Number.getData(numberFromTextField: "random") {
            number in
            self.number = number
            DispatchQueue.main.async {
                self.contextLabel.text = self.number.text
            }
        }
    }
    
    
}
