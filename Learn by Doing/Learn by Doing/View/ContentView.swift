//
//  ContentView.swift
//  Learn by Doing
//
//  Created by Zdenko Čepan on 31/07/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 20) {
                ForEach(cardData) { card in
                    CardView(card: card)
                } // LOOP
            } // HSTACK
            .padding(20)
        } // SCROLL
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
