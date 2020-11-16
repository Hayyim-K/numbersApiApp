//
//  Number.swift
//  numbersApiApp
//
//  Created by vitasiy on 16.11.2020.
//

import UIKit

struct Number: Decodable {
    let text: String?
    let number: Int?
    let found: Bool?
    let type: String?
    
    static func getData(textField: UITextField, label: UILabel) {
        let data = NetworkManager.shared
        data.getNetworkData(textField: textField, label: label)
    }
    
    static func getRandomData(label: UILabel) {
        let data = NetworkManager.shared
        data.getRandom(label: label)
    }
}
