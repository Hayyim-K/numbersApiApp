//
//  NetworkManager.swift
//  numbersApiApp
//
//  Created by vitasiy on 16.11.2020.
//

import UIKit
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func getTranslate3(incomingText: String?,
                           outgoingText: @escaping (Any) -> Void) {
            
            let headers = [
                "content-type": "application/json",
                "X-RapidAPI-Key": "b22949332fmsh58b1955eaff8bf1p1422ecjsn3318e332328d",
                "X-RapidAPI-Host": "rapid-translate-multi-traduction.p.rapidapi.com"
            ]
            let parameters = [
                "from": "en",
                "to": "uk",
                "e": "",
                "q": ["\(incomingText ?? "Hello!")"]
            ] as [String : Any]
            
            guard let postData = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {return}
            
            guard let url = URL(string:  "https://rapid-translate-multi-traduction.p.rapidapi.com/t") else {return}
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = headers
            request.httpBody = postData
            
            URLSession.shared.dataTask(with: request) {
                (data, _, error) in
                
                if let error = error {
                    print(error)
                    return
                }
                
                if let data = data {
                    let resultData = try? JSONSerialization.jsonObject(with: data, options: [])
                    print("DATA DATA DATA: \(String(describing: resultData))")
                    outgoingText(resultData as Any)
                }
            }.resume()
        }
        
        
        func getNetworkData(numberFromTextField: String,
                            completion: @escaping (Number) -> Void) {
            
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
                    completion(number)
                    print(number)
                    
                } catch let error {
                    print(error)
                }
            }.resume()
            
        }
    
// MARK: trash
    
    //ЧеРЕЗ GOOGLE API TRANSLATE ... ЭТОТ СЕТЕВОЙ ЗАПРОС ИНИЦИАЛИЗИРУЕТ ЗАГРУЗКУ ТЕКСТОВОГО ФАЙЛА С ПЕРЕВОДОМ... НО ГУГЛ СТАЛ ЗАПРАШИВАТЬ КАПЧУ...
    func getTranslate(incomingText: String?,
                      outgoingText: @escaping (String) -> Void) {
        
        
        
        let stringURL = "http://translate.google.ru/translate_a/t?client=x&text=\(incomingText ?? "problem")&hl=en&sl=en&tl=ru"
        
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
                let text = try JSONDecoder().decode(String.self, from: data)
                print(text)
                outgoingText(text)
                
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
    
    //ЧЕРЕЗ ЯНДЕКС API TRANSLATe
    func getTranslate2(incomingText: String?,
                       outgoingText: @escaping (Any) -> Void) {
        
        let stringURL = "https://translate.api.cloud.yandex.net/translate/v2/translate"
        
        guard let url = URL(string: stringURL) else { return }
        
        
        let translateTextModel = Translate(targetLanguageCode: "ru",
                                           texts: ["\(incomingText!)"])
        //                    sourceLanguageCode: "en",
        //                    format: "PLAIN_TEXT",
        //                    folderId: "b0c2ffb7uc2c0tru7pol"
        
        
        
        let apiKey = HTTPHeader(name: "Authorization", value: "Api-Key AQVNwK-sGCjrFFnFK1bzhV45gdJ1tOS5MuznIriT")
        let header = HTTPHeader(name: "Content-Type", value: "application/json")
        
        
        AF.request(url,
                   method: .post,
                   parameters: translateTextModel,
                   headers: HTTPHeaders([header, apiKey]))
        .validate()
        .responseDecodable(of: Translate.self) { respose in
            switch respose.result {
                
            case .success(let translate):
                let translateTextModel2 = Translate(
                    targetLanguageCode: translate.targetLanguageCode,
                    texts: translate.texts
                )
                
                print(translateTextModel2)
                let text = translateTextModel2.texts
                outgoingText(text)
                
            case .failure(let error):
                print(error)
            }
        }
        
        
        // ЕСЛИ БЕЗ AF:
        
        //        guard let translateData = try? JSONSerialization.data(withJSONObject: translateTextModel, options: []) else { return }
        
        //        guard let translateData = try? JSONEncoder().encode(translateTextModel) else { return }
        //        print(translateData)
        //        var request = URLRequest(url: url)
        //        request.httpMethod = "POST"
        //        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //        request.addValue("AQVNwK-sGCjrFFnFK1bzhV45gdJ1tOS5MuznIriT", forHTTPHeaderField: "Authorization: Api-Key")
        //        request.httpBody = translateData
        //
        //        print("2")
        //
        //        URLSession.shared.dataTask(with: request) { (data, response, error) in
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
        //            print("3")
        //
        //            do {
        //                //let text = try JSONDecoder().decode(String.self, from: data)
        //                let text = try JSONSerialization.jsonObject(with: data, options: [])
        //                print(text)
        //                outgoingText(text)
        //
        //            } catch let error {
        //                print(error)
        //            }
        //
        //        }.resume()
    }
    
    
    
    private init() {}
    
}
