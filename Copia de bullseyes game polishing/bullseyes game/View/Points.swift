//
//  Points.swift
//  bullseyes game
//
//  Created by Alexis on 13/2/22.
//

import SwiftUI

struct PointsView: View {
    @Binding  var sliderValue: Double
    @Binding var alertIsVisible: Bool
    @Binding   var game: Game
    
    var body: some View {
        let roundedValue = Int(sliderValue)
        let points = game.Point(sliderValue: roundedValue)
        VStack(spacing: 10){
           InstructionText(text: "The slider value is ")
            BigNumberText(text: String(roundedValue))
            BodyText(text: "Your score \(points) points \n 🎉🎉🎉🎉🎉")
            Button(action: {
                withAnimation{
                alertIsVisible = false
                }
                game.startNewRound(points: points)
            }){
            ButtomText(text: "Start a new round")
            }
            
        }
            .padding()
            .frame(maxWidth: 300)
            .background(Color("BackgroundColor"))
            .cornerRadius(21.0)
            .shadow(radius: 10, x: 5, y: 5)
            .transition(.scale)
    }
        
}


struct Points_Previews: PreviewProvider {
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    static var previews: some View {
        
        PointsView(sliderValue: sliderValue, alertIsVisible: alertIsVisible, game: game)
        PointsView(sliderValue: sliderValue, alertIsVisible: alertIsVisible, game: game).previewLayout(.fixed(width: 568, height: 320))
        PointsView(sliderValue: sliderValue, alertIsVisible: alertIsVisible, game: game)
            .preferredColorScheme(.dark)
        PointsView(sliderValue: sliderValue, alertIsVisible: alertIsVisible, game: game).previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.dark)
    }
}
