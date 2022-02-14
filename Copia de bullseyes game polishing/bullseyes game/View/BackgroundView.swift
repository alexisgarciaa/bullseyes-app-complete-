//
//  BackgroundView.swift
//  bullseyes game
//
//  Created by Alexis on 13/2/22.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    var body: some View {
        VStack{
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
        ringView()
        )
    }
}
struct TopView: View {
    @Binding var game: Game
    @State private var leaderBoardIsShowing = false
    var body: some View {
        HStack(spacing: 10){
            Button(action: {
                game.restart()
            }) {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            }
       
            Spacer()
            Button(action: {
                leaderBoardIsShowing = true
            }){
        RoundedImageViewFill(systemName: "list.dash")
            }
            .sheet(isPresented: $leaderBoardIsShowing, onDismiss: {}, content: { LeaderBoardView(leaderBoardIsShowing: $leaderBoardIsShowing, game: $game)
                
            })
        }
    }
}
struct NumberView: View {
    var title: String
    var text: String
    
    var body: some View {
        VStack(spacing: 8 ){
            LabelText(text: title.uppercased())
            RoundReactTextView(text: text)
        }
    }
}

struct BottomView: View {
    @Binding var game: Game
    var body: some View {
        HStack(spacing: 10){
            NumberView(title: "Score", text: String(game.score))
            Spacer()
            NumberView(title: "Round", text: String(game.round))
        }
    }
}

struct ringView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View{
        ZStack{
            Color("BackgroundColor")
               .edgesIgnoringSafeArea(.all)
            ForEach(1..<9){ rings in
                let size = CGFloat(rings * 100)
                let opacity =  colorScheme == .dark ? 0.1 : 0.3
            Circle()
                .stroke(lineWidth: 20.00)
                .fill(
                    RadialGradient(gradient: Gradient(colors: [Color("RingsColor").opacity(
                        opacity), Color("RingsColor").opacity(0.0)]), center: .center, startRadius: 100, endRadius: 300)

                )
                .frame(width: size, height: size)
                
            }
            
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
