//  Created on 01/05/2023.

import Foundation

struct ViewMapper {
    static func mapPlayer(player: Player) -> PlayerViewData {
        
        let gridPosition = player.grid?.split(separator: ":")
        let nameComponents = player.name.components(separatedBy: " ")
        let lastName = nameComponents.last
        
        return PlayerViewData(id: player.id, playerNumber: player.number, posX: Int(gridPosition?.first ?? "") ?? 0, posY: Int(gridPosition?.last ?? "") ?? 0, shirtName: lastName ?? "")
    }
}
