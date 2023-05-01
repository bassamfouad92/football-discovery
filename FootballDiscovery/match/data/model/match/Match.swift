//  Created on 29/04/2023.

import Foundation

struct Match: Codable, Identifiable {
    
    let id = UUID()
    let fixture: Fixture
    let teams: Teams
    let goals: Goals
    
    private enum CodingKeys: String, CodingKey { case fixture, teams, goals }

}

struct Goals: Codable {
    let home: Int
    let away: Int
}
