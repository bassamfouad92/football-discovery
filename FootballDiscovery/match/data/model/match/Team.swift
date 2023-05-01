//  Created on 29/04/2023.

import Foundation

struct Teams: Codable {
    let home: Team
    let away: Team
}

struct Team: Codable {
    let id: Int
    let name: String
    let logo: String
    let winner: Bool?
    var players: [Player]?
    var formation: String?
}
