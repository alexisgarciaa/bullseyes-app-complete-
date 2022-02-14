//
//  RoundedView.swift
//  bullseyes game
//
//  Created by Alexis on 13/2/22.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56.00, height: 56.00)
            .overlay(
            Circle()
                .strokeBorder(Color("ButtomStrokeColor"), lineWidth: 2.0 )
            )
        
    }
}
struct RoundedImageViewFill: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtomFilledTextColor"))
            .frame(width: 56.00, height: 56.00)
            .background(
            Circle()
                .fill(Color("ButtomFilledBackgroundColor"))
            )
    }
}
struct RoundReactTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .kerning(-0.2)
            .bold()
            .font(.title3)
            .frame(width: 68.0, height: 56.0)
            .foregroundColor(Color("TextColor"))
            .overlay(
                RoundedRectangle(cornerRadius: 21.0)
                    .stroke(lineWidth: 2.0)
                    .foregroundColor(Color("ButtomStrokeColor"))
            )
    }
}

struct RoundedTextView: View {
    let text: String
    
    var body: some View{
        Text(text)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56.00, height: 56.00)
            .overlay(
            Circle()
                .strokeBorder(Color("LeaderBoardColor"), lineWidth: 2.0 )
            )
    }
}

struct PreviewView: View {
    var body: some View{
        VStack(spacing: 10){
        RoundedImageViewStroked(systemName: "arrow.counterclockwise")
        RoundedImageViewFill(systemName: "list.dash")
            RoundReactTextView(text: "99")
            RoundedTextView(text: "1")
        }
    }
}

struct RoundedView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(.dark)
    }
}
