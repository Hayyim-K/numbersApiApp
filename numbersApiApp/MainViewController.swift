//
//  MainViewController.swift
//  numbersApiApp
//
//  Created by vitasiy on 16.11.2020.
//

import UIKit


class MainViewController: UIViewController {

    
    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var contextLabel: UILabel!
    
    
    
    
    
    @IBAction func tryButtonPressed() {
//        Number.getData(textField: numberTextField, label: contextLabel)
        let number = numberTextField.text ?? "random"
        let data = Number.getData(numberFromTextField: number)
        
        contextLabel.text = data.text
        
        
        
//        let stringURL = "http://numbersapi.com/\(numberTextField.text ?? "random")?json"
//
//        guard let url = URL(string: stringURL) else { return }
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//
//            if let error = error {
//                print(error)
//                return
//            }
//
//            if let response = response {
//                print(response)
//            }
//
//            guard let data = data else { return }
//
//            do {
//                let number = try JSONDecoder().decode(Number.self, from: data)
//                print(number)
//                DispatchQueue.main.async {
//                    self.contextLabel.text = number.text
//                }
//
//            } catch let error {
//                print(error)
//                DispatchQueue.main.async {
//                    self.contextLabel.text = "Проблемы, пардон..."
//                }
//            }
//
//        }.resume()
        
    }


    
    
    @IBAction func randomButtonPressed() {
        
//        Number.getRandomData(label: contextLabel)
        
        let number = "random"
        let data = Number.getData(numberFromTextField: number)
        contextLabel.text = data.text
        
//        let stringURL = "http://numbersapi.com/random?json"
//
//        guard let url = URL(string: stringURL) else { return }
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//
//            if let error = error {
//                print(error)
//                return
//            }
//
//            if let response = response {
//                print(response)
//            }
//
//            guard let data = data else { return }
//
//            do {
//                let number = try JSONDecoder().decode(Number.self, from: data)
//                print(number)
//                DispatchQueue.main.async {
//                    self.contextLabel.text = number.text
//                }
//
//            } catch let error {
//                print(error)
//                DispatchQueue.main.async {
//                    self.contextLabel.text = "Проблемы, пардон..."
//                }
//            }
//
//        }.resume()
//    }
    
}

//extension MainViewController: NetworkManagerDelegate {
//    var delegateTextField: String {
//       numberTextField.text ?? "random"
//    }
    
    
}
