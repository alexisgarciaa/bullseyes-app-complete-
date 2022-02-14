//
//  ContentView.swift
//  bullseyes game
//
//  Created by Alexis on 12/2/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.00
    @State private var game: Game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                
                InstrutionView(game: $game)
                    .padding(.bottom, alertIsVisible ? 0 : 100)
                if alertIsVisible{
                    PointsView(sliderValue: $sliderValue, alertIsVisible: $alertIsVisible, game: $game)
                        .transition(.scale)
                }else{
                HitmeButtom(sliderValue: $sliderValue, alertIsVisible: $alertIsVisible, game: $game)
                }
                }
            if !alertIsVisible{
            SliderView(sliderValue: $sliderValue)
                    .transition(.scale)
            }
        }
        
    }
}

//MARK: views
struct InstrutionView: View {
    @Binding var game: Game
    
    var body: some View{
        VStack {
            InstructionText(text: "🎯🎯🎯\n PUT THE BULLSEYES AS CLOSE AS YOU CAN")
            .padding(.leading, 30.0)
            .padding(.trailing, 30.0)
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    @Binding  var sliderValue: Double
    
    var body: some View{
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
        }
        .padding()
    }
}
struct HitmeButtom: View {
    @Binding  var sliderValue: Double
    @Binding var alertIsVisible: Bool
    @Binding   var game: Game
    
    var body: some View{
        Button(action: {
            withAnimation{
            alertIsVisible = true
            }
            
        }) {
            Text("Hit me".uppercased())
                .bold()
                .font(.title3)
        }
        .padding(20.0)
        .background(
            ZStack {
            Color("ButtomColor")
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
        })
        .foregroundColor(Color.white)
        .cornerRadius(21.0)
        .overlay(
            RoundedRectangle(cornerRadius: 21.0)
                .strokeBorder(Color.white , lineWidth: 2.0)        )
//        .alert(isPresented: $alertIsVisible,
//               content: {
//            let roundedValue: Int = Int(sliderValue.rounded())
//            let points = game.Point(sliderValue: roundedValue)
//            return Alert(title: Text("hello ther "), message: Text("the Slider value is \(roundedValue).\n" + "your points are \(points)"), dismissButton: .default(Text("Awesome")){
//                game.startNewRound(points: points)
//
//            })
//        })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
        ContentView().previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.dark)
    }
}
