//  Created on 01/05/2023.

import Foundation

enum PositionType: String, Codable {
    
    case forward = "F"
    case midfielder = "M"
    case defender = "D"
    case goalkeeper = "G"
    
    private enum CodingKeys: String, CodingKey {
            case forward = "F", midfielder = "M", defender = "D", goalkeeper = "G"
    }
}
