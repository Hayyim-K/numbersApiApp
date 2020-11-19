//
//  Number.swift
//  numbersApiApp
//
//  Created by vitasiy on 16.11.2020.
//



struct Number: Codable {
    let text: String?
    let number: Int?
    let found: Bool?
    let type: String?
    
    static func getData(numberFromTextField: String,
                        completion: @escaping (Number) -> Void) {
        let data = NetworkManager.shared
        data.getNetworkData(numberFromTextField: numberFromTextField) {
            number in
            completion(number)
        }
    }
}

struct Translate: Codable {
//    let sourceLanguageCode: String?
    let targetLanguageCode: String?
//    let format: String?
    let texts: [String?]
//    let folderId: String?

}

struct AnswerFromNetwork: Codable {
    let translations: [Content]
    
//    init(content: [String: Any]) {
//        translations = content["text"] as? String?
//
//    }
}

struct Content: Codable {
    let text: String?
    let detectedLanguageCode: String?
}

  
