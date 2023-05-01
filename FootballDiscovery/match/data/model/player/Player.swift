//  Created on 01/05/2023.

import Foundation

struct Player: Codable, Identifiable {
    
    let id: Int
    let name: String
    let number: Int
    let pos: PositionType?
    let grid: String?
    
}
