//  Created on 01/05/2023.

import SwiftUI

struct ScoreView: View {
    
    let match: Match
    
    var body: some View {
        HStack {
            VStack {
                ImageView(url: URL(string: match.teams.home.logo)!).frame(width: 30, height: 30)
                Text(match.teams.home.name)
                    .font(.system(size: 12))
                    .fontWeight(Font.Weight.light)
                    .padding(.leading, 5)
            }.frame(width: 120)
            Spacer()
            VStack {
                Text("\(match.goals.home)-\(match.goals.away)")
                    .font(.system(size: 30))
                        .padding(.horizontal, 10)
                        .clipShape(Capsule())
                Text("\(match.fixture.status.elapsed ?? 0)'").font(.caption)
                Text("\(match.fixture.status.long ?? "N/A")").font(.caption2)
            }
            Spacer()
            VStack {
                ImageView(url: URL(string: match.teams.away.logo)!).frame(width: 30, height: 30)
                Text(match.teams.away.name)
                    .font(.system(size: 12))
                    .fontWeight(Font.Weight.light)
                    .foregroundColor(.yellow)
                    .padding(.trailing, 5)
                    .tint(.white)
            }.frame(width: 120)
        }
    }
}

