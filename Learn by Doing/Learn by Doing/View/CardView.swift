//
//  CardView.swift
//  Learn by Doing
//
//  Created by Zdenko Čepan on 01/08/2021.
//

import SwiftUI

struct CardView: View {
    // MARK: - Properties
    var gradient: [Color] = [Color("Color01"), Color("Color02")]
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Image("developer-no1")
            
            VStack {
                Text("SwiftUI")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                
                Text("Better apps. Less code.")
                    .fontWeight(.light)
                    .italic()
            } // VSTACK
            .foregroundColor(.white)
            .offset(y: -218)
            
            Button(action: {
                print("Button was tapped.")
            }, label: {
                HStack {
                    Text("Learn".uppercased())
                        .fontWeight(.heavy)
                    
                    Image(systemName: "arrow.right.circle")
                        .font(.title.weight(.medium))
                } // HSTACK
                .accentColor(.white)
                .padding(.vertical)
                .padding(.horizontal, 24)
                .background(LinearGradient(gradient: Gradient(colors: gradient),
                                           startPoint: .leading,
                                           endPoint: .trailing))
                .clipShape(Capsule())
                .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
            }) // BUTTON
            .offset(y: 210)
            
        } // ZSTACK
        .frame(width: 335, height: 545)
        .background(LinearGradient(gradient: Gradient(colors: gradient),
                                   startPoint: .top,
                                   endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 8)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
            .previewLayout(.sizeThatFits)
    }
}