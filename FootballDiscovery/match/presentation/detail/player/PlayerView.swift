//  Created on 01/05/2023.

import SwiftUI

struct PlayerView: View {
    
    let player: PlayerViewData
        
    var body: some View {
         VStack(spacing: 2) {
             ZStack {
                 Image(systemName: "tshirt.fill")
                    .font(.system(size: 40))
                    .tint(.red)
                    .padding(2)
                    .foregroundColor(.purple)
                    .clipShape(Circle())
                 Text("\(player.playerNumber)").foregroundColor(.white).padding(2)
                     .font(Font.headline.weight(.bold))
             }
            Text("\(player.shirtName)")
                 .font(Font.headline.weight(.bold)).foregroundColor(.yellow)
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(player: PlayerViewData(id: 1, playerNumber: 10, posX: 4, posY: 1, shirtName: "Messi"))
    }
}
