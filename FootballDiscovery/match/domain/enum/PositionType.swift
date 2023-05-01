//  Created on 01/05/2023.

import Foundation

enum PositionType: Codable {
    
    case forward
    case midfielder
    case defender
    case goalkeeper
    
    private enum CodingKeys: String, CodingKey {
            case forward = "F", midfielder = "M", defender = "D", goalkeeper = "G"
    }
}
