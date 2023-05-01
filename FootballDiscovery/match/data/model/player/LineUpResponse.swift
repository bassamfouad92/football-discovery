//  Created on 01/05/2023.

import Foundation

struct LineUpResponse: Codable {
    let response: [LineUp]
}

struct LineUp: Codable {
    let team: Team
    let formation: String
    let startXI: [[String: Player]]
    
    func mapToTeam() -> Team {
        var teamModel = team
            teamModel.formation = self.formation
            teamModel.players = startXI.map { if let player = $0["player"] {
               return player
             }
                return Player(id: -1, name: "", number: 0, pos: .defender, grid: nil)
           }
        return teamModel
    }
}
