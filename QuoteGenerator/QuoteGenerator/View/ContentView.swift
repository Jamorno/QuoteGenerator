//
//  ContentView.swift
//  QuoteGenerator
//
//  Created by Jamorn Suttipong on 10/1/2568 BE.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = QuoteGeneratorViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 20) {
                Text("'\(viewModel.quote)'")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.center)
                Text("\(viewModel.author)")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Button {
                viewModel.fetchNewQuote()
            } label: {
                Text("GET QUOTE")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 280, height: 80)
                    .background(.black.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
