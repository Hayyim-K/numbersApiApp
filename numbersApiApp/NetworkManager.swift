//
//  NetworkManager.swift
//  numbersApiApp
//
//  Created by vitasiy on 16.11.2020.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    var num: Number = Number(text: "Первый блин комом =))", number: 0, found: true, type: "")
    
    func getNetworkData(textField: UITextField, label: UILabel) {
        
        let stringURL = "http://numbersapi.com/\(textField.text ?? "random")?json"
        
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            
            do {
                let number = try JSONDecoder().decode(Number.self, from: data)
                print(number)
                DispatchQueue.main.async {
                    label.text = number.text
                }
            } catch let error {
                print(error)
                DispatchQueue.main.async {
                    label.text = "Проблемы, пардон..."
                }
            }
            
        }.resume()
    }
    
    func getRandom(label: UILabel) {
        
        let stringURL = "http://numbersapi.com/random?json"
        
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            
            do {
                let number = try JSONDecoder().decode(Number.self, from: data)
                print(number)
                DispatchQueue.main.async {
                    label.text = number.text
                }
            } catch let error {
                print(error)
                DispatchQueue.main.async {
                    label.text = "Проблемы, пардон..."
                }
            }
            
        }.resume()
    }
    
    func getNetworkData2(numberFromTextField: String) {
        
        
        let stringURL = "http://numbersapi.com/\(numberFromTextField)?json"
        
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            
            do {
                let number = try JSONDecoder().decode(Number.self, from: data)
                DispatchQueue.main.async {
                    print(number )
                    self.num = number
                }
                
                
            } catch let error {
                print(error)
            }
            
        }.resume()
        
    }
    
    private init() {}
    
}
