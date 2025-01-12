//
//  QuoteGeneratorViewModel.swift
//  QuoteGenerator
//
//  Created by Jamorn Suttipong on 10/1/2568 BE.
//

import Foundation

class QuoteGeneratorViewModel: ObservableObject {
    
    @Published var quote: String = "Quote"
    @Published var author: String = ""
    
    private let quoteService = QuoteService()
    
    func fetchNewQuote() {
        quoteService.fetchQuote { [weak self] quote, author in
            DispatchQueue.main.async {
                self?.quote = quote ?? "Error loading quote"
                self?.author = author ?? "Unknow author"
            }
        }
    }
}
