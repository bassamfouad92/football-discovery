//  Created on 30/04/2023.

import Foundation

struct MatchResponse: Codable {
    let response: [Match]
    let results: Int
    let get: String
}
