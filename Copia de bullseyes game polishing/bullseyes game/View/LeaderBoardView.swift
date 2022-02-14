//
//  LeaderBoardView.swift
//  bullseyes game
//
//  Created by Alexis on 14/2/22.
//

import SwiftUI

struct LeaderBoardView: View {
   // @Binding var alertIsVisible: Bool
    @Binding var leaderBoardIsShowing: Bool
    @Binding   var game: Game
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 10){
                HeaderView( leaderBoardIsShowing: $leaderBoardIsShowing)
                LabelView()
                ScrollView {
                    VStack(spacing: 10){
                        ForEach(game.leaderboardEntries.indices){ i in
                            let leaderboardEntry = game.leaderboardEntries[i]
                            RowView(index: i, score: leaderboardEntry.score, date: leaderboardEntry.date  )
                        }
                    }
                }
            }
        }
    }
}
struct RowView: View {
    let index: Int
    let score: Int
    let date : Date
    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width:50.0)
            Spacer()
            DateText(date: Date())
                .frame(width:170.0)
        }
        .background(
            RoundedRectangle(cornerRadius:
                                .infinity)
                                .strokeBorder(Color("LeaderBoardColor"), lineWidth: 2.0)
                            )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: 480.0)
          
        
    }
}
struct HeaderView: View {
    //@Binding var alertIsVisible: Bool
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Binding var leaderBoardIsShowing: Bool

    var body: some View {
        ZStack {
            HStack {
                
                if verticalSizeClass == .regular && horizontalSizeClass == .compact{
                    BigBoldText(text: "LEADERBOARD")
                        .padding(.leading)
                    Spacer()
                } else {
                    BigBoldText(text: "LEADERBOARD")
                    
                }
            }
            HStack{
                Spacer()
                Button(action: {
                    leaderBoardIsShowing = false
                }){
                RoundedImageViewFill(systemName: "xmark")
                    .padding(.trailing)
                }
            }
        }
    }
}

struct LabelView: View {
    
    var body: some View {
        HStack{
            Spacer()
                .frame(width:21.0)
            Spacer()
            LabelText(text: "score")
                .frame(width:50.0)
            Spacer()
            LabelText(text: "date")
                .frame(width:170.0)

        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: 480.0)
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static private var leaderBoardIsShowing = Binding.constant(false)
    static private var game = Binding.constant(Game(loadTestData: true ))
    static var previews: some View {
        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
.previewLayout(.fixed(width: 568, height: 320))
        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)

            .preferredColorScheme(.dark)
        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
.previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.dark)
    }
}
