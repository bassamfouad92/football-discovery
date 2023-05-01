//  Created on 30/04/2023.

import SwiftUI

struct MatchListItem: View {
    
        let match: Match
        
        var body: some View {
            
            HStack {
                VStack {
                    ImageView(url: URL(string: match.teams.home.logo)!).frame(width: 30, height: 30)
                    Text(match.teams.home.name)
                        .font(.system(size: 12))
                        .fontWeight(Font.Weight.light)
                        .padding(.leading, 5)
                        .foregroundColor(.black)
                        .scaledToFit()
                }.frame(width: 100)
                Spacer()
                Text("\(match.goals.home)-\(match.goals.away)")
                        .font(.headline)
                        .padding(.horizontal, 10)
                        .foregroundColor(.white)
                        .background(Color.purple)
                        .clipShape(Capsule())
                Spacer()
                VStack {
                    ImageView(url: URL(string: match.teams.away.logo)!).frame(width: 30, height: 30)
                    Text(match.teams.away.name)
                        .font(.system(size: 12))
                        .fontWeight(Font.Weight.light)
                        .foregroundColor(.black)
                        .padding(.trailing, 5)
                        .scaledToFit()
                }.frame(width: 100)
            }.frame(height: 80).overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(.purple, lineWidth: 1)
            )
        }
}
