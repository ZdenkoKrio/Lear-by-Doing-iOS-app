//
//  CardView.swift
//  Learn by Doing
//
//  Created by Zdenko Čepan on 01/08/2021.
//

import SwiftUI

struct CardView: View {
    // MARK: - Properties
    let card: Card
    var haptic = UIImpactFeedbackGenerator(style: .heavy)
    
    @State private var fadeIn: Bool = false
    @State private var moveDownward: Bool = false
    @State private var moveUpward: Bool = false
    @State private var showAlert: Bool = false
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Image(card.image)
                .opacity(fadeIn ? 1 : 0)
            
            VStack {
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                
                Text(card.headline)
                    .fontWeight(.light)
                    .italic()
            } // VSTACK
            .foregroundColor(.white)
            .offset(y: moveDownward ? -218 : -300)
            
            Button(action: {
                print("Button was tapped.")
                
                playSound(sound: "sound-chime", type: "mp3")
                self.haptic.impactOccurred()
                self.showAlert.toggle()
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
                .background(LinearGradient(gradient: Gradient(colors: card.gradientColors),
                                           startPoint: .leading,
                                           endPoint: .trailing))
                .clipShape(Capsule())
                .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
            }) // BUTTON
            .offset(y: moveUpward ? 210 : 300)
            
        } // ZSTACK
        .frame(width: 335, height: 545)
        .background(LinearGradient(gradient: Gradient(colors: card.gradientColors),
                                   startPoint: .top,
                                   endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear() {
            withAnimation(.linear(duration: 1.2)) {
                self.fadeIn.toggle()
            }
            withAnimation(.linear(duration: 0.8)) {
                self.moveDownward.toggle()
                self.moveUpward.toggle()
            }
        } // ON_APPEAR
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text(card.title),
                  message: Text(card.message),
                  dismissButton: .default(Text("OK")))
        }) // ALERT
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardData[1])
            .previewLayout(.sizeThatFits)
    }
}
