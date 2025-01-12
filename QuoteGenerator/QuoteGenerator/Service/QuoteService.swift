//
//  QuoteService.swift
//  QuoteGenerator
//
//  Created by Jamorn Suttipong on 12/1/2568 BE.
//

import Foundation

class QuoteService {
    
    let urlString = "https://zenquotes.io/api/random"
    
    func fetchQuote(completion: @escaping (String?, String?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil, nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil, nil)
                return
            }
            
            guard let data = data else {
                completion(nil, nil)
                return
            }
            
            do {
                if let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]],
                   let firstQuote = jsonArray.first,
                   let quoteText = firstQuote["q"] as? String,
                   let author = firstQuote["a"] as? String {
                    completion(quoteText, author)
                } else {
                    completion(nil, nil)
                }
            } catch {
                completion(nil, nil)
            }
        }
        .resume()
    }
}
