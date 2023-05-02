//  Created on 01/05/2023.

import SwiftUI

struct FootballFieldView: View {
            
    @Binding var players: [PlayerViewData]
    let maxColCounts: [Int: Int]
 
        var body: some View {
            ZStack(alignment: .topLeading) {
                Image("football_field")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                ForEach(players) { player in
                    let row = player.posX
                    let col = player.posY
                    let width = UIScreen.main.bounds.width
                    let height = UIScreen.main.bounds.height
                    let gridWidth = width / 2
                    let gridHeight = height / 2
                    let dividePlayerFactor = CGFloat(1 + (maxColCounts[row] ?? 0)) * 0.5
                    let x = CGFloat(CGFloat(col) * gridWidth/dividePlayerFactor) * 1
                    let y = CGFloat(CGFloat(row) * gridHeight / 4)
                    let playerView = PlayerView(player: player)
                    playerView
                        .position(x: x, y: y)
                        .frame(width: gridWidth, height: gridHeight)
                }
            }.background(Color.black)
        }
}

/*struct FootballFieldView_Previews: PreviewProvider {
    static var previews: some View {
        FootballFieldView(viewModel: FootballFieldViewModel(players: [
            PlayerViewData(id:1, playerNumber: 1, posX: 1, posY: 1, shirtName: "Bassam", isGoalKeeper: false, maxYPos: 4)
        ]))
    }
}*/
