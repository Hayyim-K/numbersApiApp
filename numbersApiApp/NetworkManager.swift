//
//  NetworkManager.swift
//  numbersApiApp
//
//  Created by vitasiy on 16.11.2020.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
//    var delegateTextField: NetworkManagerDelegate!
//    
//    func getNetworkData() {
//        
//        let stringURL = "http://numbersapi.com/\(delegateTextField ?? "random")?json"
//        
//        guard let url = URL(string: stringURL) else { return }
//        
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
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
//                }
//            } catch let error {
//                print(error)
//                }
//            }
//            
//        }.resume()
//    }
    
    private init() {}
    
}